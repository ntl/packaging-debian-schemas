module Packaging
  module Debian
    module Schemas
      module Controls
        module Repository
          module PackageIndex
            module Minimal
              def self.example
                entries = [Entry::Minimal.example]

                PackageIndex.example(entries: entries)
              end

              module Text
                def self.example
                  Entry::Minimal::Text.example
                end
              end
            end
          end
        end
      end
    end
  end
end
