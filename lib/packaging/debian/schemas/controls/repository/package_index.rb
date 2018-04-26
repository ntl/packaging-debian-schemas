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

            def self.filename(suite: nil, component: nil, architecture: nil)
              suite ||= Suite.example
              component ||= Component.example
              architecture ||= Architecture.example

              "dists/#{suite}/#{component}/#{architecture}/Packages.gz"
            end

            module Alternate
              def self.filename(suite: nil)
                suite ||= Suite::Alternate.example

                component = Component::Alternate.example
                architecture = Architecture::Alternate.example

                PackageIndex.filename(suite: suite, component: component, architecture: architecture)
              end
            end
          end
        end
      end
    end
  end
end
