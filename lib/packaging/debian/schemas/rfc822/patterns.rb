module Packaging
  module Debian
    module Schemas
      module RFC822
        module Patterns
          def self.comment
            %r{\A\#.*[\r\n]}
          end

          def self.blank_line
            %r{\A[[:blank:]]*[\r\n]}
          end

          def self.field
            field_name = %r{(?<field>[[:graph:]]*?)}

            inline_value = %r{.*\n}

            multiline_text = %r{(?:[[:blank:]]+.*\n)}

            %r{
              (?<field>#{field_name})  # SomeField
              :[[:blank:]]*            #          :
              (?<value>                #
                    #{inline_value}        #            some data\n
                    #{multiline_text}*     #                         foo\n  bar
              )
            }x
          end
        end
      end
    end
  end
end
