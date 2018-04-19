module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module Minimal
            def self.example
              attributes = {}

              Release.optional_attributes.each do |attribute|
                attributes[attribute] = :none
              end

              Release.example(**attributes)
            end

            def self.data
              {
                :suite => Release.suite,
                :codename => Release.codename,
                :architectures => Release.architectures * ', ',
                :components => Release.components * ', ',
                :date => Release.date.rfc2822,
                :sha256 => Release.sha256
              }
            end

            module Text
              def self.example
                <<~TEXT
                Suite: #{Release.suite}
                Codename: #{Release.codename}
                Architectures: #{Release.architectures * ', '}
                Components: #{Release.components * ', '}
                Date: #{Release.date.rfc2822}
                SHA256: #{Release.sha256}
                TEXT
              end
            end
          end
        end
      end
    end
  end
end
