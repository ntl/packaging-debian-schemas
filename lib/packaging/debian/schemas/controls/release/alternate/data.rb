module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module Alternate
            module Data
              extend self

              def self.example
                data = {}

                Release.attributes.each do |attribute|
                  value = self.public_send(attribute)

                  data[attribute] = value
                end

                data
              end

              def suite
                Suite::Alternate.example
              end

              def codename
                Codename::Alternate.example
              end

              def architectures
                Set.new([
                  Architecture::Alternate.example,
                ])
              end

              def components
                Set.new([
                  Component::Alternate.example,
                ])
              end

              def date
                Time::Alternate::Raw.example
              end

              def files
                [
                  File::Data.example,
                  Release::File::Data.example
                ]
              end

              def description
                'Other repository description'
              end

              def origin
                'other-origin'
              end

              def label
                'other-label'
              end

              def version
                '2.2'
              end

              def valid_until
                Time::Alternate::Raw.example(offset: 111)
              end

              def md5_sum
                Digest::MD5::Alternate.example
              end

              def sha1
                Digest::SHA1::Alternate.example
              end

              def not_automatic
                false
              end

              def but_automatic_upgrades
                false
              end

              def acquire_by_hash
                true
              end

              def signed_by
                '0000 1111 2222 3333, AAAA BBBB CCCC DDDD'
              end
            end
          end
        end
      end
    end
  end
end
