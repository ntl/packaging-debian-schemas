module Packaging
  module Debian
    module Schemas
      module Controls
        module Repository
          module PackageIndex
            module Entry
              module Data
                extend Package::Data
                extend self

                def self.example(filename: nil, size: nil, md5sum: nil, sha1: nil, sha256: nil, sha512: nil, description_md5: nil, **package_attributes)
                  data = {}

                  Entry.non_package_attributes.each do |attribute|
                    value = binding.local_variable_get(attribute)

                    next if value == :none

                    if value.nil?
                      value = self.public_send(attribute)
                    end

                    data[attribute] = value
                  end

                  package_data = Package::Data.example(**package_attributes)

                  data.merge!(package_data)

                  data
                end

                def filename
                  "#{package}-#{version}.deb"
                end

                def size
                  111
                end

                def md5sum
                  Digest::MD5.hexdigest('some-md5sum')
                end

                def sha1
                  Digest::SHA1.hexdigest('some-sha1')
                end

                def sha256
                  Digest::SHA256.hexdigest('some-sha256')
                end

                def sha512
                  Digest::SHA512.hexdigest('some-sha512')
                end

                def description_md5
                  Digest::MD5.hexdigest("#{description}\n")
                end
              end
            end
          end
        end
      end
    end
  end
end
