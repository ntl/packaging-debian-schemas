require_relative '../../automated_init'

context "Relase" do
  context "Add File" do
    context "Already Added" do
      filename = Controls::Release::File.filename
      prior_size = Controls::Release::Alternate::File.size
      size = Controls::Release::File.size

      refute(size == prior_size)

      release = Release.new
      assert(release.files.empty?)

      release.add_file(filename, prior_size)

      context "Normal Variant" do
        test "Error is raised" do
          assert proc { release.add_file(filename, size) } do
            raises_error?(Release::FileAddedError)
          end
        end
      end

      context "Forceful Variant" do
        context do
          test "Error is not raised" do
            refute proc { release.add_file!(filename, size) } do
              raises_error?(Release::FileAddedError)
            end
          end

          test "File is added" do
            assert release do
              file? { |file| file.size == size }
            end
          end

          test "Old file is overwritten" do
            refute release do
              file? { |file| file.size == prior_size }
            end
          end
        end

        context "Optional Attributes Are Given" do
          md5 = Controls::Release::Alternate::File.md5
          sha1 = Controls::Release::Alternate::File.sha1
          sha256 = Controls::Release::Alternate::File.sha256

          release.add_file!(
            filename,
            size,
            md5: md5,
            sha1: sha1,
            sha256: sha256
          )

          test "MD5Sum" do
            assert(release.file? { |file| file.md5 == md5 })
          end

          test "SHA1" do
            assert(release.file? { |file| file.sha1 == sha1 })
          end

          test "SHA256" do
            assert(release.file? { |file| file.sha256 == sha256 })
          end
        end
      end
    end
  end
end
