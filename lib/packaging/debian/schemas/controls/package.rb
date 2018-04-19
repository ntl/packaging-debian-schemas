module Packaging
  module Debian
    module Schemas
      module Controls
        module Package
          extend Data

          def self.example(**attributes)
            data = Data.example(**attributes)

            Schemas::Package.build(data)
          end

          def self.attributes
            Schemas::Package.attribute_names
          end

          def self.required_attributes
            %i[package version maintainer description]
          end

          def self.optional_attributes
            attributes - required_attributes
          end
        end
      end
    end
  end
end
