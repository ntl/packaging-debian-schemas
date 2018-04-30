module Packaging
  module Debian
    module Schemas
      module Controls
        module PackageIndex
          module Text
            extend self

            def example
              <<~TEXT
                  #{Entry::Text.example.chomp}

                  #{Entry::Alternate::Text.example.chomp}
              TEXT
            end

            def size
              text = example
              text.bytesize
            end

            def md5
              text = example

              Digest::MD5.example(text)
            end

            def sha1
              text = example

              Digest::SHA1.example(text)
            end

            def sha256
              text = example

              Digest::SHA256.example(text)
            end

            def sha512
              text = example

              Digest::SHA512.example(text)
            end
          end
        end
      end
    end
  end
end
