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

            def self.size
              ::File.size(example)
            end

            def self.sha256
              '1685f490558ec3ca1fd43bbfe39c822b0035eed85eed615d724e8505492d1f0e'
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
