module Packaging
  module Debian
    module Schemas
      module Repository
        class PackageIndex
          module Assertions
            def package_count?(count)
              entries.size == count
            end
          end
        end
      end
    end
  end
end
