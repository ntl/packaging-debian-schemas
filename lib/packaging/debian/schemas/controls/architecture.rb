module Packaging
  module Debian
    module Schemas
      module Controls
        module Architecture
          def self.example
            'i386'
          end

          def self.all
            'all'
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
