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

              def self.size
                text = example
                text.bytesize
              end

              def self.md5
                text = example

                Digest::MD5.example(text)
              end

              def self.sha1
                text = example

                Digest::SHA1.example(text)
              end

              def self.sha256
                text = example

                Digest::SHA256.example(text)
              end

              def self.sha512
                text = example

                Digest::SHA512.example(text)
              end
            end
          end
        end
      end
    end
  end
end
