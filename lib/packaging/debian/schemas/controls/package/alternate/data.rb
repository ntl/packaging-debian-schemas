module Packaging
  module Debian
    module Schemas
      module Controls
        module Package
          module Alternate
            module Data
              extend self

              def self.example
                data = {}

                Package.attributes.each do |attribute|
                  value = self.public_send(attribute)

                  data[attribute] = value
                end

                data
              end

              def package
                'other-package'
              end

              def source
                "other-source-package (#{version})"
              end

              def version
                "#{upstream_version}-#{revision}"
              end

              def upstream_version
                '2.2.2'
              end

              def revision
                '22'
              end

              def section
                'other-section'
              end

              def priority
                'extra'
              end

              def architecture
                Architecture::Alternate.example
              end

              def essential
                false
              end

              def depends
                'other-dependency'
              end

              def pre_depends
                'other-pre-dependency'
              end

              def recommends
                'other-recommended-dependency'
              end

              def suggests
                'other-suggested-dependency'
              end

              def enhances
                'other-enhanced-dependency'
              end

              def breaks
                'other-broken-dependency'
              end

              def conflicts
                'other-conflicted-dependency'
              end

              def installed_size
                2222
              end

              def maintainer
                'Other Maintainer'
              end

              def description
                'Other package'
              end

              def homepage
                'http://example.com/other'
              end

              def built_using
                'gcc-2.22'
              end
            end
          end
        end
      end
    end
  end
end
