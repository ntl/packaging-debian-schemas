require_relative '../../automated_init'

context "Package Index" do
  context "Add" do
    context "Added" do
      package_index = PackageIndex.new

      filename = Controls::PackageIndex::Entry.filename
      size = Controls::PackageIndex::Entry.size

      entry = package_index.add(filename, size)

      test "Entry is returned" do
        assert(entry.instance_of?(PackageIndex::Entry))
      end

      test "Entry is added to index" do
        assert package_index do
          entry?(entry)
        end
      end

      context "Attributes" do
        test "Filename" do
          assert(entry.filename == filename)
        end

        test "Size" do
          assert(entry.size == size)
        end
      end
    end
  end
end
