module Packaging
  module Debian
    module Schemas
      module Controls
        module RFC822
          module Text
            def self.example
              <<~TEXT
                Some-Field: Some Value
                Other-Field: First Line
                 Second Line
                 Third Line

                Some-Field: Other Value
                Other-Field: Yet Another Value
              TEXT
            end

            module Comments
              def self.example
                <<~TEXT
                  # Some Comment
                  Some-Field: Some Value
                  Other-Field: First Line
                   Second Line
                   Third Line

                  Some-Field: Other Value
                  Other-Field: Yet Another Value

                  # Other Comment
                TEXT
              end
            end

            module VariedWhitespace
              def self.example
                <<~TEXT
                  Some-Field: Some Value
                  Other-Field:
                      First Line
                      Second Line
                  \tThird Line


                  Some-Field: Other Value
                  Other-Field: Yet Another Value

                TEXT
              end
            end

            module Invalid
              def self.example
                <<~TEXT
                foo=bar
                TEXT
              end
            end

            module SingleParagraph
              def self.example
                <<~TEXT
                  Some-Field: Some Value
                  Other-Field: First Line
                   Second Line
                   Third Line
                TEXT
              end
            end
          end
        end
      end
    end
  end
end
