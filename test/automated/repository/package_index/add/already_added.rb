require_relative '../../../automated_init'

context "Repository" do
  context "Package Index" do
    context "Add" do
      context "Already Added" do
        package_index = Repository::PackageIndex.new

        prior_entry = Controls::Repository::PackageIndex::Entry.example
        package_index.add_entry(prior_entry)

        filename = prior_entry.filename

        control_entry = Controls::Repository::PackageIndex::Entry::Alternate.example
        control_entry.filename = filename

        package = Controls::Package::Alternate.example

        size = control_entry.size

        context "Normal Variant" do
          test "Error is raised" do
            assert proc { package_index.add(filename, size) } do
              raises_error?(Repository::PackageIndex::EntryAddedError)
            end
          end
        end

        context "Forceful Variant" do
          context do
            entry = nil

            test "Error is not raised" do
              refute proc { entry = package_index.add!(filename, size) } do
                raises_error?(Repository::PackageIndex::EntryAddedError)
              end
            end

            test "Entry is added to index" do
              assert package_index do
                entry?(entry)
              end
            end

            test "Prior entry is overwritten" do
              refute package_index do
                entry?(prior_entry)
              end
            end
          end

          context "Optional Attributes Are Given" do
            md5sum = control_entry.md5sum
            sha1 = control_entry.sha1
            sha256 = control_entry.sha256
            sha512 = control_entry.sha512
            description_md5 = control_entry.description_md5

            package_index.add!(
              filename,
              size,
              md5sum: md5sum,
              sha1: sha1,
              sha256: sha256,
              sha512: sha512,
              description_md5: description_md5,
              package: package
            )

            test "All attributes are overwritten" do
              assert package_index do
                entry?(control_entry)
              end
            end
          end
        end
      end
    end
  end
end
