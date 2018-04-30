require_relative '../automated_init'

context "Release" do
  context "Serialization" do
    context do
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
    end

    context "Mixture of Checksum Types" do
      control_release = Release.build
      control_release.add_file('file1', 11, sha256: 'some-sha256')
      control_release.add_file('file2', 22, sha1: 'some-sha1')
      control_release.add_file('file3', 33, md5: 'some-md5')

      control_text = <<~RFC822
      SHA256:
       some-sha256 11 file1
      MD5Sum:
       some-md5 33 file3
      SHA1:
       some-sha1 22 file2
      RFC822

      context "Read" do
        release = Transform::Read.(control_text, :rfc822, Release)

        assert(release == control_release)
      end

      context "Write" do
        text = Transform::Write.(control_release, :rfc822)

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
