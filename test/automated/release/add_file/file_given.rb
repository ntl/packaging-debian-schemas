require_relative '../../automated_init'

context "Relase" do
  context "Add File" do
    context "File Given" do
      file_contents = Controls::Digest::SHA256.text

      raw_file = Tempfile.create('example-file')
      raw_file.write(file_contents)

      context do
        release = Release.new

        file = release.add_file(raw_file)

        test "File data structure is returned" do
          assert(file.instance_of?(Release::File))
        end

        context "Attributes" do
          test "Filename" do
            assert(file.filename == File.basename(raw_file.path))
          end

          test "Size" do
            assert(file.size == file_contents.bytesize)
          end

          test "SHA256 is calculated and set" do
            assert(file.sha256 == Controls::Digest::SHA256.example)
          end

          test "MD5 is not set" do
            assert(file.md5.nil?)
          end

          test "SHA1 is not set" do
            assert(file.sha1.nil?)
          end
        end
      end

      context "Checksums are provided" do
        release = Release.new

        sha256 = Controls::Random.unique_text
        sha1 = Controls::Random.unique_text
        md5 = Controls::Random.unique_text

        file = release.add_file(raw_file, sha256: sha256, sha1: sha1, md5: md5)
        assert(file.instance_of?(Release::File))

        test "SHA256 is set to value given" do
          assert(file.sha256 == sha256)
        end

        test "MD5 is set" do
          assert(file.md5 == md5)
        end

        test "SHA1 is set" do
          assert(file.sha1 == sha1)
        end
      end

    ensure
      raw_file.close

      File.unlink(raw_file.path)
    end
  end
end
