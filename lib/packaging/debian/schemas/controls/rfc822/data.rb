module Packaging
  module Debian
    module Schemas
      module Controls
        module RFC822
          module Data
            def self.example
              [
                {
                  :some_field => 'Some Value',
                  :other_field => "First Line\nSecond Line\nThird Line",
                },
                {
                  :some_field => 'Other Value',
                  :other_field => 'Yet Another Value'
                }
              ]
            end

            module SingleParagraph
              def self.example
                {
                  :some_field => 'Some Value',
                  :other_field => "First Line\nSecond Line\nThird Line",
                }
              end
            end
          end
        end
      end
    end
  end
end
