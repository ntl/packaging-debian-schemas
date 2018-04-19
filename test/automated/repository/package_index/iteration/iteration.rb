require_relative '../../../automated_init'

context "Repository" do
  context "Package Index" do
    context "Iteration" do
      package_index = Repository::PackageIndex.new

      entry_1 = Controls::Repository::PackageIndex::Entry.example
      entry_2 = Controls::Repository::PackageIndex::Entry::Alternate.example

      package_index.add_entry(entry_1)
      package_index.add_entry(entry_2)

      visited_entries = []

      package_index.each do |entry|
        visited_entries << entry
      end

      test "Each entry is visited" do
        assert(visited_entries.include?(entry_1))
        assert(visited_entries.include?(entry_2))
      end

      test "Each entry is visited once" do
        assert(visited_entries.count == 2)
      end
    end
  end
end
