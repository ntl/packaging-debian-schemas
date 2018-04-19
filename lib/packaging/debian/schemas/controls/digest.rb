module Packaging
  module Debian
    module Schemas
      module Controls
        module Digest
          module MD5
            def self.example(text=nil)
              text ||= self.text

              ::Digest::MD5.hexdigest(text)
            end

            def self.text
              'some-md5sum'
            end

            module Alternate
              def self.example
                MD5.example(text)
              end

              def self.text
                'other-md5sum'
              end
            end
          end

          module SHA1
            def self.example(text=nil)
              text ||= self.text

              ::Digest::SHA1.hexdigest(text)
            end

            def self.text
              'some-sha1'
            end

            module Alternate
              def self.example
                SHA1.example(text)
              end

              def self.text
                'other-sha1'
              end
            end
          end

          module SHA256
            def self.example(text=nil)
              text ||= self.text

              ::Digest::SHA256.hexdigest(text)
            end

            def self.text
              'some-sha256'
            end

            module Alternate
              def self.example
                SHA256.example(text)
              end

              def self.text
                'other-sha256'
              end
            end
          end

          module SHA512
            def self.example(text=nil)
              text ||= self.text

              ::Digest::SHA512.hexdigest(text)
            end

            def self.text
              'some-sha512'
            end

            module Alternate
              def self.example
                SHA512.example(text)
              end

              def self.text
                'other-sha512'
              end
            end
          end
        end
      end
    end
  end
end
