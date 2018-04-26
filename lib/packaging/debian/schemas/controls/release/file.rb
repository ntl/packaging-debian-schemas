module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          module File
            extend self

            def filename(filename: nil, suite: nil)
              filename ||= Repository::PackageIndex.filename

              release_filename = Release.filename(suite: suite)
              relative_root = ::File.dirname(release_filename)

              filename = Pathname(filename).
                relative_path_from(Pathname(relative_root)).to_s

              filename
            end

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

              file = Schemas::Release::File.new
              file.filename = filename
              file.size = size
              file.md5_sum = md5 unless md5 == :none
              file.sha1 = sha1 unless sha1 == :none
              file.sha256 = sha256 unless sha256 == :none
              file
            end

            def size
              Repository::PackageIndex::Text.size
            end

            def md5
              Repository::PackageIndex::Text.md5
            end

            def sha1
              Repository::PackageIndex::Text.sha1
            end

            def sha256
              Repository::PackageIndex::Text.sha256
            end

            module Data
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
