require_relative '../automated_init'

context "Package Index" do
  context "Added Predicate" do
    filename = Controls::PackageIndex::Entry.filename
    size = Controls::PackageIndex::Entry.size

    context "Entry Added" do
      package_index = PackageIndex.new

      entry = Controls::PackageIndex::Entry.example
      package_index.add_entry(entry)

      test "Returns true" do
        assert(package_index.added?(filename))
      end
    end

    context "Entry Not Added" do
      package_index = PackageIndex.new

      test "Returns false" do
        refute(package_index.added?(filename))
      end
    end
  end
end
