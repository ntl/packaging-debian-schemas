module Packaging
  module Debian
    module Schemas
      module Controls
        module Time
          def self.example(time=nil)
            time = Raw.example

            time.rfc2822
          end

          module Raw
            def self.example
              Clock::Controls::Time::Raw.example
            end
          end

          module Alternate
            def self.example
              time = Raw.example

              Time.example(time)
            end

            module Raw
              def self.example
                Time::Raw.example + 3600
              end
            end
          end
        end
      end
    end
  end
end
