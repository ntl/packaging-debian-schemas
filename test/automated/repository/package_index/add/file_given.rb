require_relative '../../../automated_init'

context "Repository" do
  context "Package Index" do
    context "Add" do
      context "File Given" do
        file_contents = Controls::Digest::SHA256.text

        file = Tempfile.create('example-file')
        file.write(file_contents)

        context do
          package_index = Repository::PackageIndex.new

          entry = package_index.add(file)

          test "Entry data structure is returned" do
            assert(entry.instance_of?(Repository::PackageIndex::Entry))
          end

          context "Attributes" do
            test "Filename" do
              assert(entry.filename == File.basename(file.path))
            end

            test "Size" do
              assert(entry.size == file_contents.bytesize)
            end

            test "SHA256 is calculated and set" do
              assert(entry.sha256 == Controls::Digest::SHA256.example)
            end

            test "MD5 is not set" do
              assert(entry.md5sum.nil?)
            end

            test "SHA1 is not set" do
              assert(entry.sha1.nil?)
            end

            test "SHA512 is not set" do
              assert(entry.sha512.nil?)
            end

            test "Description MD5 is not set" do
              assert(entry.description_md5.nil?)
            end
          end
        end

        context "Checksums are provided" do
          package_index = Repository::PackageIndex.new

          sha256 = Controls::Random.unique_text
          sha512 = Controls::Random.unique_text
          sha1 = Controls::Random.unique_text
          description_md5 = Controls::Random.unique_text
          md5 = Controls::Random.unique_text

          entry = package_index.add(
            file,
            sha256: sha256,
            sha512: sha512,
            sha1: sha1,
            md5sum: md5,
            description_md5: description_md5
          )

          test "SHA256 is set to value given" do
            assert(entry.sha256 == sha256)
          end

          test "SHA512 is set to value given" do
            assert(entry.sha512 == sha512)
          end

          test "MD5 is set" do
            assert(entry.md5sum == md5)
          end

          test "Description MD5 is set" do
            assert(entry.description_md5 == description_md5)
          end

          test "SHA1 is set" do
            assert(entry.sha1 == sha1)
          end
        end

      ensure
        file.close

        File.unlink(file.path)
      end
    end
  end
end
