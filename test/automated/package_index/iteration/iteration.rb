require_relative '../../automated_init'

context "Package Index" do
  context "Iteration" do
    package_index = PackageIndex.new

    entry_1 = Controls::PackageIndex::Entry.example
    entry_2 = Controls::PackageIndex::Entry::Alternate.example

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
