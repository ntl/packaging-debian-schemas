module Packaging
  module Debian
    module Schemas
      module Repository
        class PackageIndex
          module Transform
            def self.rfc822
              RFC822
            end

            def self.instance(raw_data)
              index = PackageIndex.build

              raw_data.each do |entry_data|
                entry = build_entry(entry_data)

                index.add(entry)
              end

              index
            end

            def self.raw_data(index)
              index.entries.map do |entry|
                input_entry_data = entry.to_h

                entry_data = {
                  :filename => input_entry_data.delete(:filename),
                  :size => input_entry_data.delete(:size),
                  'MD5sum' => input_entry_data.delete(:md5sum),
                  'SHA1' => input_entry_data.delete(:sha1),
                  'SHA256' => input_entry_data.delete(:sha256),
                  'SHA512' => input_entry_data.delete(:sha512),
                  'Description-md5' => input_entry_data.delete(:description_md5)
                }

                package_entry_data = Package::Transform.raw_data(input_entry_data)

                entry_data.merge!(package_entry_data)

                entry_data
              end
            end

            def self.build_entry(entry_data)
              size = entry_data.delete(:size)

              unless size.nil?
                entry_data[:size] = Integer(size)
              end

              Package::Transform.instance(entry_data, PackageIndex::Entry)
            end
          end
        end
      end
    end
  end
end
