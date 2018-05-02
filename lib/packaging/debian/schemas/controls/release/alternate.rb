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

            module Text
              extend Release::Text
              extend Data
            end
          end
        end
      end
    end
  end
end
