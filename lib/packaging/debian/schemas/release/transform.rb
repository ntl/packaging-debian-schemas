module Packaging
  module Debian
    module Schemas
      class Release
        module Transform
          def self.rfc822
            RFC822::SingleParagraph
          end

          def self.instance(raw_data, cls=nil)
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

            instance
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

            unless instance.sha256.nil?
              raw_data['SHA256'] = instance.sha256
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

            unless instance.md5_sum.nil?
              raw_data['MD5Sum'] = instance.md5_sum
            end

            unless instance.sha1.nil?
              raw_data['SHA1'] = instance.sha1
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
