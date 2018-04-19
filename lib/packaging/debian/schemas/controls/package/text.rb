module Packaging
  module Debian
    module Schemas
      module Controls
        module Package
          module Text
            extend self

            extend Data

            def example
              <<~TEXT
              Package: #{package}
              Source: #{source}
              Version: #{version}
              Section: #{section}
              Priority: #{priority}
              Architecture: #{architecture}
              Essential: #{essential ? 'yes' : 'no'}
              Depends: #{depends}
              Pre-Depends: #{pre_depends}
              Recommends: #{recommends}
              Suggests: #{suggests}
              Enhances: #{enhances}
              Breaks: #{breaks}
              Conflicts: #{conflicts}
              Installed-Size: #{installed_size}
              Maintainer: #{maintainer}
              Description: #{description}
              Homepage: #{homepage}
              Built-Using: #{built_using}
              TEXT
            end
          end
        end
      end
    end
  end
end
