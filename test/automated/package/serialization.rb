require_relative '../automated_init'

context "Package" do
  context "Serialization" do
    control_package = Controls::Package.example

    control_text = Controls::Package::Text.example

    context "Read" do
      package = Transform::Read.(control_text, :rfc822, Package)

      test do
        assert(package == control_package)
      end
    end

    context "Write" do
      text = Transform::Write.(control_package, :rfc822)

      test do
        assert(text == control_text)
      end
    end
  end
end
