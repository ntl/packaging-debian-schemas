require_relative '../../automated_init'

context "Package Index" do
  context "Add Entry" do
    context "Already Removed" do
      package_index = PackageIndex.new

      entry = Controls::PackageIndex::Entry.example

      return_value = package_index.remove_entry(entry)

      test "Entry remains absent from index" do
        refute package_index do
          entry?(entry)
        end
      end

      test "False is returned" do
        assert(return_value == false)
      end
    end
  end
end
