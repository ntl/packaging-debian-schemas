module Packaging
  module Debian
    module Schemas
      module Repository
        class PackageIndex
          include Schema::DataStructure

          attribute :entries, Array, default: proc { Array.new }

          def add_entry(entry)
            entries << entry
          end
        end
      end
    end
  end
end
