module Packaging
  module Debian
    module Schemas
      module Controls
        module PackageIndex
          def self.example(entries: nil)
            entries ||= [Entry.example, Entry::Alternate.example]

            package_index = Schemas::PackageIndex.new

            entries.each do |entry|
              package_index.add_entry(entry)
            end

            package_index
          end

          def self.filename(suite: nil, component: nil, architecture: nil)
            suite ||= Suite.example
            component ||= Component.example
            architecture ||= Architecture.example

            "dists/#{suite}/#{component}/binary-#{architecture}/Packages.gz"
          end
        end
      end
    end
  end
end
