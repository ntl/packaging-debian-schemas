require_relative '../../automated_init'

context "Release" do
  context "Add File" do
    context "Added Predicate" do
      filename = Controls::Release::File.filename
      size = Controls::Release::File.size

      context "File Added" do
        release = Release.new

        file = Controls::Release::File.example
        release.files << file

        test "Returns true" do
          assert(release.added_file?(filename))
        end
      end

      context "Entry Not Added" do
        release = Release.new

        test "Returns false" do
          refute(release.added_file?(filename))
        end
      end
    end
  end
end
