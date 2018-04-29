module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module Minimal
            def self.example
              attributes = {
                :files => files,
                :components => components,
                :architectures => architectures
              }

              Release.optional_attributes.each do |attribute|
                attributes[attribute] = :none
              end

              Release.example(**attributes)
            end

            def self.files
              [file]
            end

            def self.file
              Release::File.example(md5: :none, sha1: :none)
            end

            def self.components
              Set.new([component])
            end

            def self.component
              Component.example
            end

            def self.architectures
              Set.new([architecture])
            end

            def self.architecture
              Architecture.example
            end

            module Text
              def self.example
                file = Minimal.file

                <<~TEXT
                Suite: #{Release.suite}
                Architectures: #{Minimal.architecture}
                Components: #{Minimal.component}
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
