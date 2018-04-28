module Packaging
  module Debian
    module Schemas
      module Controls
        module Package
          module File
            def self.example
              ::File.join(__dir__, 'file', basename)
            end

            def self.basename
              "#{Data.package}-#{Data.version}.deb"
            end

            module Malformed
              def self.example
                ::File.join(__dir__, 'file', basename)
              end

              def self.basename
                "malformed.deb"
              end
            end
          end
        end
      end
    end
  end
end
