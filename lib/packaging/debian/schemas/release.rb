module Packaging
  module Debian
    module Schemas
      class Release
        include Log::Dependency

        include Schema::DataStructure

        attribute :suite, String
        attribute :codename, String
        attribute :architectures, Set, default: proc { Set.new }
        attribute :components, Set, default: proc { Set.new }
        attribute :date, Time

        attribute :files, Array, default: proc { Array.new }

        attribute :description, String
        attribute :origin, String
        attribute :label, String
        attribute :version, String

        attribute :valid_until, Time

        attribute :not_automatic
        attribute :but_automatic_upgrades
        attribute :acquire_by_hash

        attribute :signed_by, String

        def self.build(data=nil)
          if data.is_a?(Hash) && data.key?(:files)
            files = data.delete(:files)

            files = files.map do |file_data|
              File.build(file_data)
            end

            data[:files] = files
          end

          super(data)
        end

        def add_file(file_or_filename, size=nil, md5: nil, sha1: nil, sha256: nil, force: nil)
          case file_or_filename
          when ::File, ::Tempfile
            path = file_or_filename.path

            filename = ::File.basename(path)

            size ||= file_or_filename.size
            sha256 ||= self.class.sha256(path)
          else
            filename = file_or_filename
          end

          if size.nil?
            error_message = "Size not supplied and could not be inferred (File: #{filename.inspect})"
            raise ArgumentError, error_message
          end

          file = File.new
          file.filename = filename
          file.size = size
          file.md5 = md5 unless md5.nil?
          file.sha1 = sha1 unless sha1.nil?
          file.sha256 = sha256 unless sha256.nil?

          if force
            add_file_entry!(file)
          else
            add_file_entry(file)
          end
        end

        def add_file!(file_or_filename, size=nil, **arguments)
          add_file(file_or_filename, size, force: true, **arguments)
        end

        def add_file_entry(file)
          filename = file.filename

          if added_file?(filename)
            error_message = "File already added (Filename: #{filename})"
            logger.error { error_message }
            raise FileAddedError, error_message
          end

          files << file

          file
        end

        def add_file_entry!(file)
          filename = file.filename

          files.delete_if do |file|
            file.filename == filename
          end

          add_file_entry(file)
        end

        def added_file?(filename)
          files.any? do |file|
            file.filename == filename
          end
        end

        def self.sha256(path)
          SHA256.(path)
        end

        class File
          include Schema::DataStructure

          attribute :filename, String
          attribute :size, Integer
          attribute :md5, String
          attribute :sha1, String
          attribute :sha256, String
        end

        FileAddedError = Class.new(StandardError)

        module Assertions
          def file?(file=nil, &block)
            unless file.nil?
              block ||= proc { |f| f == file }
            end

            files.any?(&block)
          end

          def one_file?(file=nil, &block)
            unless file.nil?
              block ||= proc { |f| f == file }
            end

            files.one?(&block)
          end
          alias_method :one?, :one_file?
        end
      end
    end
  end
end
