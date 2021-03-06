require_relative '../../automated_init'

context "Package Index" do
  context "Add Entry" do
    context "Already Added" do
      package_index = PackageIndex.new

      prior_entry = Controls::PackageIndex::Entry.example
      package_index.add_entry(prior_entry)

      entry = Controls::PackageIndex::Entry::Alternate.example
      entry.filename = prior_entry.filename

      package_index.add_entry(entry)

      test "Entry is added to index" do
        assert package_index do
          entry?(entry)
        end
      end

      test "Prior entry is overwritten" do
        refute package_index do
          entry?(prior_entry)
        end
      end
    end
  end
end
