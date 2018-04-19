require_relative '../../automated_init'

context "Repository" do
  context "Package Index" do
    context "Added Predicate" do
      filename = Controls::Repository::PackageIndex::Entry.filename
      size = Controls::Repository::PackageIndex::Entry.size

      context "Entry Added" do
        package_index = Repository::PackageIndex.new

        entry = Controls::Repository::PackageIndex::Entry.example
        package_index.add_entry(entry)

        test "Returns true" do
          assert(package_index.added?(filename))
        end
      end

      context "Entry Not Added" do
        package_index = Repository::PackageIndex.new

        test "Returns false" do
          refute(package_index.added?(filename))
        end
      end
    end
  end
end
