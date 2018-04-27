require_relative '../../../automated_init'

context "Repository" do
  context "Package Index" do
    context "Add File" do
      context "Temp File Given" do
        filename = Controls::Repository::PackageIndex::Entry.filename

        package_index = Repository::PackageIndex.new

        test "Raises ArgumentError" do
          assert proc { package_index.add(filename) } do
            raises_error?(ArgumentError)
          end
        end
      end
    end
  end
end
