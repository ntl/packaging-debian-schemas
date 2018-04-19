require_relative '../../../automated_init'

context "Repository" do
  context "Package Index" do
    context "Add" do
      context "Added" do
        package_index = Repository::PackageIndex.new

        filename = Controls::Repository::PackageIndex::Entry.filename
        size = Controls::Repository::PackageIndex::Entry.size

        entry = package_index.add(filename, size)

        test "Entry is returned" do
          assert(entry.instance_of?(Repository::PackageIndex::Entry))
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
end
