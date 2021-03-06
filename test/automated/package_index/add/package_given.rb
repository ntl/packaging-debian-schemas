require_relative '../../automated_init'

context "Package Index" do
  context "Add" do
    context "Package Given" do
      package_index = PackageIndex.new

      filename = Controls::PackageIndex::Entry.filename
      size = Controls::PackageIndex::Entry.size

      package = Controls::Package.example

      entry = package_index.add(
        filename,
        size,
        package: package
      )

      refute(entry.nil?)

      Controls::Package.attributes.each do |attribute|
        context "#{attribute}" do
          value = entry.public_send(attribute)

          control_value = package.public_send(attribute)

          test "Value is copied to entry" do
            assert(value == control_value)
          end
        end
      end
    end
  end
end
