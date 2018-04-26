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
                filename = Repository::PackageIndex::Alternate.filename

                Release::File.filename(filename: filename)
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
