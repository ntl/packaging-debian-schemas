module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          extend Data

          def self.example(**attributes)
            data = Data.example(**attributes)

            Schemas::Release.build(data)
          end

          def self.attributes
            Schemas::Release.attribute_names
          end

          def self.required_attributes
            %i[suite codename architectures components date sha256]
          end

          def self.optional_attributes
            attributes - required_attributes
          end
        end
      end
    end
  end
end
