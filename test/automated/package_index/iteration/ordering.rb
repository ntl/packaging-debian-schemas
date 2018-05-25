require_relative '../../automated_init'

context "Package Index" do
  context "Ordering" do
    package_index = PackageIndex.new

    size = Controls::PackageIndex::Entry.size

    sorted_filenames = %w(
        a-0.0.1-1.deb
        a-0.1.0-1.deb
        a-1.0.0-1.deb
        a-1.1.0-11.deb
        a-1.1.1.deb
        a-1.1.1-10.deb
        a-1.1.1-11.deb
        a-1.1.1-12.deb
        a-1.1.2-1.deb
        a-1.2.0-1.deb
        a-2.0.0-1.deb
        b-0.0.1-1.deb
        b-0.1.1-1.deb
        b-1.1.1.deb
        b-1.1.1-1.deb
        b-1.1.1-11.deb
    )

    unsorted_filenames = sorted_filenames.shuffle

    refute(unsorted_filenames == sorted_filenames)

    unsorted_filenames.each do |filename|
      package_index.add(filename, size)
    end

    read_filenames = []

    package_index.each do |entry|
      read_filenames << entry.filename
    end

    test "Entries are iterated according to package name, then upstream version, then revision" do
      assert(read_filenames == sorted_filenames)
    end
  end
end
