module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module Alternate
            def self.example
              data = Data.example

              Schemas::Release.build(data)
            end
          end
        end
      end
    end
  end
end
