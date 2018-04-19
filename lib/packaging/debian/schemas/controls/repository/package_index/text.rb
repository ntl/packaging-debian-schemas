module Packaging
  module Debian
    module Schemas
      module Controls
        module Repository
          module PackageIndex
            module Text
              def self.example
                <<~TEXT
                  #{Entry::Text.example.chomp}

                  #{Entry::Alternate::Text.example.chomp}
                TEXT
              end
            end
          end
        end
      end
    end
  end
end
