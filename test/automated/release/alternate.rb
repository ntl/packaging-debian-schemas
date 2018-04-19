require_relative '../automated_init'

context "Release" do
  context "Control" do
    context "Alternate" do
      alternate_release = Controls::Release::Alternate.example

      context "Attributes" do
        control_release = Controls::Release.example

        Controls::Release.attributes.each do |attribute|
          test "#{attribute} differs from control" do
            control_value = control_release.public_send(attribute)

            value = alternate_release.public_send(attribute)

            refute(value == control_value)
          end
        end
      end

      context "Serialization" do
        control_alternate_text = Controls::Release::Alternate::Text.example

        context "Read" do
          read_alternate_release = Transform::Read.(control_alternate_text, :rfc822, Release)

          test "Converts to instance" do
            assert(read_alternate_release == alternate_release)
          end
        end

        context "Write" do
          alternate_text = Transform::Write.(alternate_release, :rfc822)

          test "Converts to text" do
            assert(alternate_text == control_alternate_text)
          end
        end
      end
    end
  end
end
