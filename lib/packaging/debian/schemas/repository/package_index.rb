module Packaging
  module Debian
    module Schemas
      module Repository
        class PackageIndex
          include Log::Dependency

          include Schema::DataStructure

          attribute :entries, Array, default: proc { Array.new }

          def add(filename, size, md5sum: nil, sha1: nil, sha256: nil, sha512: nil, description_md5: nil, package: nil)
            entry = Entry.new
            entry.filename = filename
            entry.size = size
            entry.sha1 = sha1
            entry.sha256 = sha256
            entry.sha512 = sha512
            entry.description_md5 = description_md5

            entry.md5sum = md5sum unless md5sum.nil?

            entries.each do |entry|
              next if entry.filename != filename

              error_message = "Entry already added (Filename: #{filename})"
              logger.error { error_message }
              raise EntityAddedError, error_message
            end

            unless package.nil?
              SetAttributes.(entry, package)
            end

            add_entry(entry)

            entry
          end

          def add_entry(entry)
            entries << entry
          end

          EntityAddedError = Class.new(StandardError)
        end
      end
    end
  end
end
