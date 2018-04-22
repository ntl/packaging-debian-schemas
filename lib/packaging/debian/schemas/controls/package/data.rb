module Packaging
  module Debian
    module Schemas
      module Controls
        module Package
          module Data
            extend self

            def self.example(package: nil, source: nil, version: nil, section: nil, priority: nil, architecture: nil, essential: nil, depends: nil, pre_depends: nil, recommends: nil, suggests: nil, enhances: nil, breaks: nil, conflicts: nil, installed_size: nil, maintainer: nil, description: nil, homepage: nil, built_using: nil)
              data = {}

              Package.attributes.each do |attribute|
                value = binding.local_variable_get(attribute)

                next if value == :none

                if value.nil?
                  value = self.public_send(attribute)
                end

                data[attribute] = value
              end

              data
            end

            def package
              'some-package'
            end

            def source
              "some-source-package (#{version})"
            end

            def version
              "#{upstream_version}-#{revision}"
            end

            def upstream_version
              '1.1.1'
            end

            def revision
              '11'
            end

            def section
              'some-section'
            end

            def priority
              'optional'
            end

            def architecture
              Architecture.example
            end

            def essential
              true
            end

            def depends
              'some-dependency'
            end

            def pre_depends
              'some-pre-dependency'
            end

            def recommends
              'some-recommended-dependency'
            end

            def suggests
              'some-suggested-dependency'
            end

            def enhances
              'some-enhanced-dependency'
            end

            def breaks
              'some-broken-dependency'
            end

            def conflicts
              'some-conflicted-dependency'
            end

            def installed_size
              1111
            end

            def maintainer
              'Some Maintainer <some.maintainer@example.com>'
            end

            def description
              'Some package'
            end

            def homepage
              'http://example.com'
            end

            def built_using
              'gcc-1.11'
            end
          end
        end
      end
    end
  end
end
