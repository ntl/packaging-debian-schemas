require_relative '../../automated_init'

context "Relase" do
  context "Add File" do
    context "Temp File Given" do
      file_contents = Controls::Digest::SHA256.text

      raw_file = Tempfile.new('example-file')
      raw_file.write(file_contents)
      raw_file.close

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
      end
    end
  end
end
