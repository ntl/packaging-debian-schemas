module Packaging
  module Debian
    module Schemas
      module RFC822
        module SingleParagraph
          def self.read(text)
            raw_data = RFC822.read(text)

            unless raw_data.count == 1
              raise MultipleParagraphsError, "Read multiple paragraphs from input text"
            end

            raw_data.fetch(0)
          end

          def self.write(raw_data)
            if raw_data.instance_of?(Hash)
              raw_data = [raw_data]
            end

            unless raw_data.count == 1
              raise MultipleParagraphsError, "Cannot write multiple paragraphs"
            end

            RFC822.write(raw_data)
          end

          MultipleParagraphsError = Class.new(StandardError)
        end
      end
    end
  end
end
