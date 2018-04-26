module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module Alternate
            module File
              extend Release::File
              extend self

              def filename
                filename = Repository::PackageIndex::Alternate.filename

                Release::File.filename(filename: filename)
              end

              module Data
                extend Release::File
                extend File

                def self.example
                  {
                    :filename => filename,
                    :size => size,
                    :md5_sum => md5,
                    :sha1 => sha1,
                    :sha256 => sha256
                  }
                end
              end
            end
          end
        end
      end
    end
  end
end
