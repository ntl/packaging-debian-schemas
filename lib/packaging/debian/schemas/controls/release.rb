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
        end
      end
    end
  end
end
