require_relative '../../automated_init'

context "Package Index" do
  context "Add File" do
    context "Temp File Given" do
      file_contents = Controls::Digest::SHA256.text

      file = Tempfile.new('example-file')
      file.write(file_contents)
      file.close

      package_index = PackageIndex.new

      entry = package_index.add(file)

      test "Entry data structure is returned" do
        assert(entry.instance_of?(PackageIndex::Entry))
      end

      context "Attributes" do
        test "Filename" do
          assert(entry.filename == File.basename(file.path))
        end

        test "Size" do
          assert(entry.size == file_contents.bytesize)
        end

        test "SHA256 is calculated and set" do
          assert(entry.sha256 == Controls::Digest::SHA256.example)
        end
      end
    end
  end
end
