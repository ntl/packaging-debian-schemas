module Packaging
  module Debian
    module Schemas
      module Controls
        module Component
          def self.example
            'some-component'
          end

          module Alternate
            def self.example
              'other-component'
            end
          end
        end
      end
    end
  end
end
