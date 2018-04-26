module Packaging
  module Debian
    module Schemas
      class Release
        module Transform
          def self.rfc822
            RFC822::SingleParagraph
          end

          def self.instance(raw_data, cls=nil)
            sha256_checksums = raw_data.delete(:sha256)
            sha1_checksums = raw_data.delete(:sha1)
            md5_checksums = raw_data.delete(:md5_sum)

            architectures = raw_data.delete(:architectures)
            unless architectures.nil?
              value = architectures.split(%r{[[:blank:]]*,[[:blank:]]*})

              raw_data[:architectures] = value
            end

            components = raw_data.delete(:components)
            unless components.nil?
              value = components.split(%r{[[:blank:]]*,[[:blank:]]*})

              raw_data[:components] = value
            end

            date = raw_data.delete(:date)
            unless date.nil?
              raw_data[:date] = ::Time.parse(date)
            end

            valid_until = raw_data.delete(:valid_until)
            unless valid_until.nil?
              raw_data[:valid_until] = ::Time.parse(valid_until)
            end

            acquire_by_hash = raw_data.delete(:acquire_by_hash)
            unless acquire_by_hash.nil?
              value = acquire_by_hash == 'yes' ? true : false

              raw_data[:acquire_by_hash] = value
            end

            not_automatic = raw_data.delete(:not_automatic)
            unless not_automatic.nil?
              value = not_automatic == 'yes' ? true : false

              raw_data[:not_automatic] = value
            end

            but_automatic_upgrades = raw_data.delete(:but_automatic_upgrades)
            unless but_automatic_upgrades.nil?
              value = but_automatic_upgrades == 'yes' ? true : false

              raw_data[:but_automatic_upgrades] = value
            end

            instance ||= cls.new

            SetAttributes.(instance, raw_data)

            files = Hash.new do |h, filename|
              h[filename] = File.build(:filename => filename)
            end

            unless sha256_checksums.nil?
              parse_checksums(sha256_checksums) do |sha256, size, filename|
                file = files[filename]
                file.size ||= Integer(size)
                file.sha256 = sha256
              end
            end

            unless sha1_checksums.nil?
              parse_checksums(sha1_checksums) do |sha1, size, filename|
                file = files[filename]
                file.size ||= Integer(size)
                file.sha1 = sha1
              end
            end

            unless md5_checksums.nil?
              parse_checksums(md5_checksums) do |md5, size, filename|
                file = files[filename]
                file.size ||= Integer(size)
                file.md5 = md5
              end
            end

            instance.files = files.values

            instance
          end

          def self.parse_checksums(text, &block)
            text.each_line do |line|
              next if line.match?(%r{\A[[:space:]]*\z})

              checksum, size, filename = line.split(%r{[[:blank:]]+})

              size = Integer(size)
              filename.chomp!

              block.(checksum, size, filename)
            end
          end

          def self.raw_data(instance)
            raw_data = {
              :suite => instance.suite,
              :codename => instance.codename
            }

            unless instance.architectures.empty?
              raw_data[:architectures] = instance.architectures * ', '
            end

            unless instance.components.empty?
              raw_data[:components] = instance.components * ', '
            end

            unless instance.date.nil?
              raw_data[:date] = instance.date.rfc2822
            end

            if instance.files.any?(&:sha256)
              raw_data['SHA256'] = instance.files.inject("\n") do |str, file|
                str << file.to_s(:sha256)
                str << "\n"
              end
            end

            if instance.files.any?(&:md5)
              raw_data['MD5Sum'] = instance.files.inject("\n") do |str, file|
                str << file.to_s(:md5)
                str << "\n"
              end
            end

            if instance.files.any?(&:sha1)
              raw_data['SHA1'] = instance.files.inject("\n") do |str, file|
                str << file.to_s(:sha1)
                str << "\n"
              end
            end

            unless instance.description.nil?
              raw_data[:description] = instance.description
            end

            unless instance.origin.nil?
              raw_data[:origin] = instance.origin
            end

            unless instance.label.nil?
              raw_data[:label] = instance.label
            end

            unless instance.version.nil?
              raw_data[:version] = instance.version
            end

            unless instance.valid_until.nil?
              raw_data[:valid_until] = instance.valid_until.rfc2822
            end

            unless instance.valid_until.nil?
              raw_data[:valid_until] = instance.valid_until.rfc2822
            end

            unless instance.not_automatic.nil?
              raw_data['NotAutomatic'] = instance.not_automatic ? 'yes' : 'no'
            end

            unless instance.but_automatic_upgrades.nil?
              raw_data['ButAutomaticUpgrades'] = instance.but_automatic_upgrades ? 'yes' : 'no'
            end

            unless instance.acquire_by_hash.nil?
              raw_data[:acquire_by_hash] = instance.acquire_by_hash ? 'yes' : 'no'
            end

            unless instance.signed_by.nil?
              raw_data[:signed_by] = instance.signed_by
            end

            raw_data
          end
        end
      end
    end
  end
end
