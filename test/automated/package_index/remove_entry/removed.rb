require_relative '../../automated_init'

context "Package Index" do
  context "Remove Entry" do
    context "Removed" do
      package_index = PackageIndex.new

      entry = Controls::PackageIndex::Entry.example

      package_index.add_entry(entry)

      return_value = package_index.remove_entry(entry)

      test "Entry is removed from index" do
        refute package_index do
          entry?(entry)
        end
      end

      test "True is returned" do
        assert(return_value == true)
      end
    end
  end
end
