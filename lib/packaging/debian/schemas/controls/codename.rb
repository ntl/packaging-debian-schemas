module Packaging
  module Debian
    module Schemas
      module Controls
        module Codename
          def self.example
            'some-codename'
          end

          module Alternate
            def self.example
              'other-codename'
            end
          end
        end
      end
    end
  end
end
