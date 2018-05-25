require_relative '../automated_init'

context "Package Index" do
  context "Control" do
    package_index = Controls::PackageIndex.example

    test "Contains two packages" do
      assert(package_index) do
        package_count?(2)
      end
    end

    entry_1, entry_2 = package_index.entries

    context "First Entry" do
      control_entry = Controls::PackageIndex::Entry.example

      context "Package Index Attributes" do
        Controls::PackageIndex::Entry.non_package_attributes.each do |attribute|
          test "#{attribute}" do
            control_value = control_entry.public_send(attribute)

            value = entry_1.public_send(attribute)

            assert(value == control_value)
          end
        end
      end

      context "Common Package Attributes" do
        Controls::Package.attributes.each do |attribute|
          test "#{attribute}" do
            control_value = control_entry.public_send(attribute)

            value = entry_1.public_send(attribute)

            assert(value == control_value)
          end
        end
      end
    end

    context "Second Entry" do
      control_entry = Controls::PackageIndex::Entry::Alternate.example

      context "Package Index Attributes" do
        Controls::PackageIndex::Entry.non_package_attributes.each do |attribute|
          test "#{attribute}" do
            control_value = control_entry.public_send(attribute)

            value = entry_2.public_send(attribute)

            assert(value == control_value)
          end
        end
      end

      context "Common Package Attributes" do
        Controls::Package.attributes.each do |attribute|
          test "#{attribute}" do
            control_value = control_entry.public_send(attribute)

            value = entry_2.public_send(attribute)

            assert(value == control_value)
          end
        end
      end
    end

    context "Differences" do
      entry_1_data = entry_1.to_h
      entry_2_data = entry_2.to_h

      assert(entry_1_data.keys == entry_2_data.keys)

      entry_1_data.each do |attribute, entry_1_value|
        entry_2_value = entry_2_data[attribute]

        test "#{attribute}" do
          refute(entry_1_value == entry_2_value)
        end
      end
    end
  end
end
