module Packaging
  module Debian
    module Schemas
      class Release
        include Schema::DataStructure

        attribute :suite, String
        attribute :codename, String
        attribute :architectures, Array, default: proc { Array.new }
        attribute :components, Array, default: proc { Array.new }
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

        def add_file(filename, size, md5: nil, sha1: nil, sha256: nil)
          file = File.new
          file.filename = filename
          file.size = size
          file.md5 = md5 unless md5.nil?
          file.sha1 = sha1 unless sha1.nil?
          file.sha256 = sha256 unless sha256.nil?

          files << file

          file
        end

        class File
          include Schema::DataStructure

          attribute :filename, String
          attribute :size, Integer
          attribute :md5, String
          attribute :sha1, String
          attribute :sha256, String

          def to_s(checksum_method=nil)
            checksum_method ||= :sha256

            checksum = public_send(checksum_method)

            "#{checksum} #{size} #{filename}"
          end
        end
      end
    end
  end
end
