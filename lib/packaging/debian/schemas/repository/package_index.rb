module Packaging
  module Debian
    module Schemas
      module Repository
        class PackageIndex
          include Schema::DataStructure

          attribute :entries, Array, default: proc { Array.new }

          def add(entry)
            entries << entry
          end

          def size
            entries.count
          end

          def [](index)
            entries[index]
          end

          class Entry
            include Schema::DataStructure

            attribute :filename, String
            attribute :size, Integer
            attribute :md5sum, String
            attribute :sha1, String
            attribute :sha256, String
            attribute :sha512, String
            attribute :description_md5, String

            include Package::Attributes
          end
        end
      end
    end
  end
end
