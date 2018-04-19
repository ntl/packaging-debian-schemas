module Packaging
  module Debian
    module Schemas
      module Controls
        module Repository
          module PackageIndex
            module Entry
              extend Data
              extend Package::Data

              def self.example(**attributes)
                data = Data.example(**attributes)

                Schemas::Repository::PackageIndex::Entry.build(data)
              end

              def self.attributes
                Package.attributes + non_package_attributes
              end

              def self.non_package_attributes
                %i[filename size md5sum sha1 sha256 sha512 description_md5]
              end

              def self.required_attributes
                %i[filename size]
              end

              def self.optional_attributes
                attributes - required_attributes
              end
            end
          end
        end
      end
    end
  end
end
