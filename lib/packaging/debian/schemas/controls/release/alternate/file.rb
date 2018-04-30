module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module Alternate
            module File
              extend Release::File
              extend self

              def example(filename: nil, size: nil, md5: nil, sha1: nil, sha256: nil)
                filename ||= self.filename

                data = Data.example(filename: filename, size: size, md5: md5, sha1: sha1, sha256: sha256)

                Schemas::Release::File.build(data)
              end

              def filename
                filename = PackageIndex::Alternate.filename
                distribution = Suite::Alternate.example

                Release::File.filename(filename: filename, distribution: distribution)
              end

              def size
                PackageIndex::Alternate::Text.size
              end

              def md5
                PackageIndex::Alternate::Text.md5
              end

              def sha1
                PackageIndex::Alternate::Text.sha1
              end

              def sha256
                PackageIndex::Alternate::Text.sha256
              end

              module Data
                extend Release::File
                extend File

                extend Release::File::Data
              end
            end
          end
        end
      end
    end
  end
end
