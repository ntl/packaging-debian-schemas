module Packaging
  module Debian
    module Schemas
      module Controls
        module Architecture
          def self.example
            'i386'
          end

          module All
            def self.example
              'all'
            end
          end

          module Alternate
            def self.example
              'sparc'
            end
          end
        end
      end
    end
  end
end
