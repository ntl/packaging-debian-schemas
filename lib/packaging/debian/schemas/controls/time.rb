module Packaging
  module Debian
    module Schemas
      module Controls
        module Time
          def self.example(time=nil, offset: nil)
            time = Raw.example(offset: offset)

            time.rfc2822
          end

          module Raw
            def self.example(offset: nil)
              time = Clock::Controls::Time::Raw.example

              time += offset unless offset.nil?

              time
            end
          end

          module Alternate
            def self.example
              time = Raw.example

              Time.example(time)
            end

            module Raw
              def self.example(offset: nil)
                effective_offset = self.offset

                effective_offset += offset unless offset.nil?

                Time::Raw.example(offset: effective_offset)
              end

              def self.offset
                3600
              end
            end
          end
        end
      end
    end
  end
end
