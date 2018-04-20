module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module Data
            extend self

            def self.example(suite: nil, codename: nil, architectures: nil, components: nil, date: nil, sha256: nil, description: nil, origin: nil, label: nil, version: nil, valid_until: nil, md5_sum: nil, sha1: nil, not_automatic: nil, but_automatic_upgrades: nil, acquire_by_hash: nil, signed_by: nil)
              data = {}

              Release.attributes.each do |attribute|
                value = binding.local_variable_get(attribute)

                next if value == :none

                if value.nil?
                  value = self.public_send(attribute)
                end

                data[attribute] = value
              end

              data
            end

            def suite
              Suite.example
            end

            def codename
              Codename.example
            end

            def architectures
              [
                Architecture.example,
                Architecture::Alternate.example
              ]
            end

            def components
              [
                Component.example,
                Component::Alternate.example
              ]
            end

            def date
              Time::Raw.example
            end

            def sha256
              Digest::SHA256.example
            end

            def description
              'Some repository description'
            end

            def origin
              'some-origin'
            end

            def label
              'somel-label'
            end

            def version
              '1.1'
            end

            def valid_until
              Time::Raw.example(offset: 111)
            end

            def md5_sum
              Digest::MD5.example
            end

            def sha1
              Digest::SHA1.example
            end

            def not_automatic
              true
            end

            def but_automatic_upgrades
              true
            end

            def acquire_by_hash
              false
            end

            def signed_by
              'AAAA BBBB CCCC DDDD, 0000 1111 2222 3333'
            end
          end
        end
      end
    end
  end
end
