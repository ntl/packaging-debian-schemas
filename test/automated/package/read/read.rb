require_relative '../../automated_init'

context "Package" do
  context "Read" do
    path = Controls::Package::File.example

    package = Package::Read.(path)

    test "Is package" do
      assert(package.instance_of?(Package))
    end

    context "Attributes" do
      control_package = Controls::Package.example

      control_package.attributes.each do |attribute, control_value|
        test "#{attribute}" do
          value = package.public_send(attribute)

          assert(value == control_value)
        end
      end
    end
  end
end
