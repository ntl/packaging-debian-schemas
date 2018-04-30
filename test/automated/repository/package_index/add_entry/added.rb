require_relative '../../../automated_init'

context "Repository" do
  context "Package Index" do
    context "Add Entry" do
      context "Added" do
        package_index = PackageIndex.new

        entry = Controls::PackageIndex::Entry.example

        package_index.add_entry(entry)

        test "Entry is added to index" do
          assert package_index do
            entry?(entry)
          end
        end
      end
    end
  end
end
