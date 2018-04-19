module Packaging
  module Debian
    module Schemas
      module Controls
        module Package
          def self.example(**attributes)
            data = Data.example(**attributes)

            Schemas::Package.build(data)
          end

          def self.attributes
            Schemas::Package.attribute_names
          end
        end
      end
    end
  end
end
