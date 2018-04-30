module Packaging
  module Debian
    module Schemas
      module Controls
        module PackageIndex
          module Alternate
            def self.filename(suite: nil)
              suite ||= Suite::Alternate.example

              component = Component::Alternate.example
              architecture = Architecture::Alternate.example

              PackageIndex.filename(suite: suite, component: component, architecture: architecture)
            end

            module Text
              extend PackageIndex::Text

              def self.example
                <<~TEXT
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
