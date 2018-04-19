module Packaging
  module Debian
    module Schemas
      class Package
        module Transform
          def self.rfc822
            RFC822::SingleParagraph
          end

          def self.instance(raw_data, cls=nil)
            installed_size = raw_data.delete(:installed_size)

            unless installed_size.nil?
              raw_data[:installed_size] = Integer(installed_size)
            end

            essential = raw_data.delete(:essential)

            unless essential.nil?
              value = essential == 'yes' ? true : false

              raw_data[:essential] = value
            end

            instance ||= cls.new

            SetAttributes.(instance, raw_data)

            instance
          end

          def self.raw_data(instance)
            raw_data = instance.to_h

            essential = raw_data[:essential]

            if essential.nil?
              raw_data.delete(:essential)
            else
              value = essential ? 'yes' : 'no'

              raw_data[:essential] = value
            end

            raw_data
          end
        end
      end
    end
  end
end
