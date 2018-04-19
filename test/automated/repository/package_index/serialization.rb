require_relative '../../automated_init'

context "Repository" do
  context "Package Index" do
    context "Serialization" do
      context do
        control_package_index = Controls::Repository::PackageIndex.example
        control_text = Controls::Repository::PackageIndex::Text.example

        context "Read" do
          package_index = Transform::Read.(control_text, :rfc822, Repository::PackageIndex)

          test do
            assert(package_index == control_package_index)
          end
        end

        context "Write" do
          text = Transform::Write.(control_package_index, :rfc822)

          test do
            assert(text == control_text)
          end
        end
      end

      context "Minimal" do
        control_package_index = Controls::Repository::PackageIndex::Minimal.example
        control_text = Controls::Repository::PackageIndex::Minimal::Text.example

        context "Read" do
          package_index = Transform::Read.(control_text, :rfc822, Repository::PackageIndex)

          test do
            assert(package_index == control_package_index)
          end
        end

        context "Write" do
          text = Transform::Write.(control_package_index, :rfc822)

          test do
            assert(text == control_text)
          end
        end
      end
    end
  end
end
