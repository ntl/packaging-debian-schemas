require_relative '../../automated_init'

context "Package Index" do
  context "Add" do
    context "Optional Attributes" do
      package_index = PackageIndex.new

      filename = Controls::PackageIndex::Entry.filename
      size = Controls::PackageIndex::Entry.size

      md5sum = Controls::PackageIndex::Entry.md5sum
      sha1 = Controls::PackageIndex::Entry.sha1
      sha256 = Controls::PackageIndex::Entry.sha256
      sha512 = Controls::PackageIndex::Entry.sha512
      description_md5 = Controls::PackageIndex::Entry.description_md5

      entry = package_index.add(
        filename,
        size,
        md5sum: md5sum,
        sha1: sha1,
        sha256: sha256,
        sha512: sha512,
        description_md5: description_md5
      )

      refute(entry.nil?)

      test "MD5sum" do
        assert(entry.md5sum == md5sum)
      end

      test "SHA1" do
        assert(entry.sha1 == sha1)
      end

      test "SHA256" do
        assert(entry.sha256 == sha256)
      end

      test "SHA512" do
        assert(entry.sha512 == sha512)
      end

      test "Description MD5" do
        assert(entry.description_md5 == description_md5)
      end
    end
  end
end
