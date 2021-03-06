module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module File
            extend self

            def filename(filename: nil, distribution: nil)
              filename ||= PackageIndex.filename

              release_filename = Release.filename(distribution: distribution)

              relative_root = ::File.join(
                ::File.dirname(release_filename),
                ''
              )

              filename.delete_prefix(relative_root)
            end

            def example(filename: nil, size: nil, md5: nil, sha1: nil, sha256: nil)
              data = Data.example(filename: filename, size: size, md5: md5, sha1: sha1, sha256: sha256)

              Schemas::Release::File.build(data)
            end

            def size
              PackageIndex::Text.size
            end

            def md5
              PackageIndex::Text.md5
            end

            def sha1
              PackageIndex::Text.sha1
            end

            def sha256
              PackageIndex::Text.sha256
            end

            module Data
              extend File
              extend self

              def example(filename: nil, size: nil, md5: nil, sha1: nil, sha256: nil)
                filename ||= self.filename
                size ||= self.size

                if md5 == :none
                  md5 = nil
                else
                  md5 ||= self.md5
                end

                if sha1 == :none
                  sha1 = nil
                else
                  sha1 ||= self.sha1
                end

                if sha256 == :none
                  sha256 = nil
                else
                  sha256 ||= self.sha256
                end

                data = {
                  :filename => filename,
                  :size => size
                }

                data[:md5] = md5 unless md5.nil?
                data[:sha1] = sha1 unless sha1.nil?
                data[:sha256] = sha256 unless sha256.nil?

                data
              end
            end
          end
        end
      end
    end
  end
end
