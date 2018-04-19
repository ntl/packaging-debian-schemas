module Packaging
  module Debian
    module Schemas
      module Controls
        module Package
          module Alternate
            def self.example
              data = Data.example

              Schemas::Package.build(data)
            end
          end
        end
      end
    end
  end
end
