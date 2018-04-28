module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module Minimal
            def self.example
              attributes = {
                :files => files
              }

              Release.optional_attributes.each do |attribute|
                attributes[attribute] = :none
              end

              Release.example(**attributes)
            end

            def self.data
              {
                :suite => Release.suite,
                :codename => Release.codename,
                :architectures => Release.architectures.to_a * ', ',
                :components => Release.components.to_a * ', ',
                :date => Release.date.rfc2822,
                :files => files
              }
            end

            def self.files
              [file]
            end

            def self.file
              Release::File.example(md5: :none, sha1: :none)
            end

            module Text
              def self.example
                file = Minimal.file

                <<~TEXT
                Suite: #{Release.suite}
                Codename: #{Release.codename}
                Architectures: #{Release.architectures.to_a * ', '}
                Components: #{Release.components.to_a * ', '}
                Date: #{Release.date.rfc2822}
                SHA256:
                 #{file.sha256} #{file.size} #{file.filename}
                TEXT
              end
            end
          end
        end
      end
    end
  end
end
