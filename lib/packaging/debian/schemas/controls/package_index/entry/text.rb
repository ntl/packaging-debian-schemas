module Packaging
  module Debian
    module Schemas
      module Controls
        module PackageIndex
          module Entry
            module Text
              extend self
              extend Package::Data
              extend Data

              def example
                <<~TEXT
                  Filename: #{filename}
                  Size: #{size}
                  MD5sum: #{md5sum}
                  SHA1: #{sha1}
                  SHA256: #{sha256}
                  SHA512: #{sha512}
                  Description-md5: #{description_md5}
                  #{package_text.chomp}
                TEXT
              end

              def package_text
                Package::Text.example
              end
            end
          end
        end
      end
    end
  end
end
