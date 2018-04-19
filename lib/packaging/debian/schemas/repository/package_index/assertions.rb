module Packaging
  module Debian
    module Schemas
      module Repository
        class PackageIndex
          module Assertions
            def entry?(entry=nil, &block)
              unless entry.nil?
                block ||= proc { |e| e == entry }
              end

              entries.any?(&block)
            end

            def one_entry?(entry=nil, &block)
              unless entry.nil?
                block ||= proc { |e| e == entry }
              end

              entries.one?(&block)
            end
            alias_method :one?, :one_entry?

            def package_count?(count)
              entries.size == count
            end
          end
        end
      end
    end
  end
end
