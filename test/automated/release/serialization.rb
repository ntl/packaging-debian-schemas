require_relative '../automated_init'

context "Release" do
  context "Serialization" do
    control_release = Controls::Release.example

    control_text = Controls::Release::Text.example

    context "Read" do
      release = Transform::Read.(control_text, :rfc822, Release)

      test do
        assert(release == control_release)
      end
    end

    context "Write" do
      text = Transform::Write.(control_release, :rfc822)

      test do
        assert(text == control_text)
      end
    end

    context "Minimal" do
      control_release = Controls::Release::Minimal.example
      control_text = Controls::Release::Minimal::Text.example

      context "Read" do
        release = Transform::Read.(control_text, :rfc822, Release)

        test do
          assert(release == control_release)
        end
      end

      context "Write" do
        text = Transform::Write.(control_release, :rfc822)

        test do
          assert(text == control_text)
        end
      end
    end
  end
end
