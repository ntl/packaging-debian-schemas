require_relative '../automated_init'

context "Package" do
  context "Control" do
    context "Alternate" do
      alternate_package = Controls::Package::Alternate.example

      context "Attributes" do
        control_package = Controls::Package.example

        Controls::Package.attributes.each do |attribute|
          test "#{attribute} differs from control" do
            control_value = control_package.public_send(attribute)

            value = alternate_package.public_send(attribute)

            refute(value == control_value)
          end
        end
      end

      context "Serialization" do
        control_alternate_text = Controls::Package::Alternate::Text.example

        context "Read" do
          read_alternate_package = Transform::Read.(control_alternate_text, :rfc822, Package)

          test "Converts to instance" do
            assert(read_alternate_package == alternate_package)
          end
        end

        context "Write" do
          alternate_text = Transform::Write.(alternate_package, :rfc822)

          test "Converts to text" do
            assert(alternate_text == control_alternate_text)
          end
        end
      end
    end
  end
end
