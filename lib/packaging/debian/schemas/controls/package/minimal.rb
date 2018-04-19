module Packaging
  module Debian
    module Schemas
      module Controls
        module Package
          module Minimal
            def self.example
              attributes = {}

              Package.optional_attributes.each do |attribute|
                attributes[attribute] = :none
              end

              Package.example(**attributes)
            end

            def self.data
              {
                :package => Package.package,
                :version => Package.version,
                :maintainer => Package.maintainer,
                :description => Package.description
              }
            end

            module Text
              def self.example
                <<~TEXT
                Package: #{Package.package}
                Version: #{Package.version}
                Maintainer: #{Package.maintainer}
                Description: #{Package.description}
                TEXT
              end
            end
          end
        end
      end
    end
  end
end
