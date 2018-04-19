require_relative '../automated_init'

context "Package" do
  context "Control" do
    context "All Attributes" do
      package = Controls::Package.example

      Package.attribute_names.each do |attribute|
        test "#{attribute}" do
          control_value = Controls::Package::Data.public_send(attribute)

          value = package.public_send(attribute)

          assert(value == control_value)
        end
      end
    end

    context "No Attributes" do
      attributes = {}

      Package.attribute_names.each do |attribute|
        attributes[attribute] = :none
      end

      package = Controls::Package.example(**attributes)

      package_data = package.to_h

      package_data.each do |attribute, value|
        test "#{attribute} is nil" do
          assert(value.nil?)
        end
      end
    end
  end
end
