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
              Architectures: #{architectures.to_a * ', '}
              Components: #{components.to_a * ', '}
              Date: #{date.rfc2822}
              SHA256:
               #{files[0][:sha256]} #{files[0][:size]} #{files[0][:filename]}
               #{files[1][:sha256]} #{files[1][:size]} #{files[1][:filename]}
              MD5Sum:
               #{files[0][:md5]} #{files[0][:size]} #{files[0][:filename]}
               #{files[1][:md5]} #{files[1][:size]} #{files[1][:filename]}
              SHA1:
               #{files[0][:sha1]} #{files[0][:size]} #{files[0][:filename]}
               #{files[1][:sha1]} #{files[1][:size]} #{files[1][:filename]}
              Description: #{description}
              Origin: #{origin}
              Label: #{label}
              Version: #{version}
              Valid-Until: #{valid_until.rfc2822}
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
