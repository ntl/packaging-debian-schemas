module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module Text
            extend self
            extend Data

            def example
              <<~TEXT
              Suite: #{suite}
              Codename: #{codename}
              Architectures: #{architectures * ', '}
              Components: #{components * ', '}
              Date: #{date.rfc2822}
              SHA256: #{sha256}
              Description: #{description}
              Origin: #{origin}
              Label: #{label}
              Version: #{version}
              Valid-Until: #{valid_until.rfc2822}
              MD5sum: #{md5sum}
              SHA1: #{sha1}
              NotAutomatic: #{not_automatic ? 'yes' : 'no'}
              ButAutomaticUpgrades: #{but_automatic_upgrades ? 'yes' : 'no'}
              Acquire-By-Hash: #{acquire_by_hash ? 'yes' : 'no'}
              Signed-By: #{signed_by}
              TEXT
            end
          end
        end
      end
    end
  end
end
