module Packaging
  module Debian
    module Schemas
      module Controls
        module Repository
          module PackageIndex
            def self.example(entries: nil)
              entries ||= [Entry.example, Entry::Alternate.example]

              package_index = Schemas::Repository::PackageIndex.new

              entries.each do |entry|
                package_index.add_entry(entry)
              end

              package_index
            end
          end
        end
      end
    end
  end
end
