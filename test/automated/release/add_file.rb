require_relative '../automated_init'

context "Relase" do
  context "Add File" do
    filename = Controls::Release::File.filename
    size = Controls::Release::File.size

    context do
      md5 = Controls::Digest::MD5.example
      sha1 = Controls::Digest::SHA1.example
      sha256 = Controls::Digest::SHA256.example

      release = Release.new

      assert(release.files.empty?)

      file = release.add_file(filename, size, md5: md5, sha1: sha1, sha256: sha256)

      test "File is added" do
        assert(release.files.count == 1)
      end

      test "Added file is returned" do
        assert(file == release.files[0])
      end

      context "Attributes" do
        test "Filename" do
          assert(file.filename == filename)
        end

        test "Size" do
          assert(file.size == size)
        end

        test "MD5" do
          assert(file.md5 == md5)
        end

        test "SHA1" do
          assert(file.sha1 == sha1)
        end

        test "SHA256" do
          assert(file.sha256 == sha256)
        end
      end
    end

    context "Optional Parameters" do
      release = Release.new

      file = release.add_file(filename, size)

      test "MD5 is not set" do
        assert(file.md5.nil?)
      end

      test "SHA1 is not set" do
        assert(file.sha1.nil?)
      end

      test "SHA256 is not set" do
        assert(file.sha256.nil?)
      end
    end
  end
end
