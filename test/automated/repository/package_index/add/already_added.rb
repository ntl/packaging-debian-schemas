require_relative '../../../automated_init'

context "Repository" do
  context "Package Index" do
    context "Add" do
      context "Already Added" do
        context do
          package_index = Repository::PackageIndex.new

          prior_entry = Controls::Repository::PackageIndex::Entry.example
          package_index.add_entry(prior_entry)

          filename = prior_entry.filename
          size = prior_entry.size

          test "Error is raised" do
            assert proc { package_index.add(filename, size) } do
              raises_error?(Repository::PackageIndex::EntryAddedError)
            end
          end
        end

        context "Via Add Entry" do
          package_index = Repository::PackageIndex.new

          prior_entry = Controls::Repository::PackageIndex::Entry.example
          package_index.add_entry(prior_entry)

          entry = Controls::Repository::PackageIndex::Entry.example

          test "Error is raised" do
            assert proc { package_index.add_entry(entry) } do
              raises_error?(Repository::PackageIndex::EntryAddedError)
            end
          end
        end
      end
    end
  end
end
