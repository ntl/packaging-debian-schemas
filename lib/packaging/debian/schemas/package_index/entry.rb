module Packaging
  module Debian
    module Schemas
      class PackageIndex
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

          def <=>(other)
            sort_key <=> other.sort_key
          end

          def sort_key
            basename = ::File.basename(filename, '.deb')

            basename.split('-')
          end
        end
      end
    end
  end
end
