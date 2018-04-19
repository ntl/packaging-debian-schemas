module Packaging
  module Debian
    module Schemas
      module Repository
        class PackageIndex
          include Schema::DataStructure

          attribute :entries, Array, default: proc { Array.new }

          def add(entry)
            entries << entry
          end

          def size
            entries.count
          end

          def [](index)
            entries[index]
          end
        end
      end
    end
  end
end
