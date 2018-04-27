require_relative '../../automated_init'

context "Relase" do
  context "Add File" do
    context "Already Added" do
      filename = Controls::Release::File.filename
      size = Controls::Release::File.size

      release = Release.new
      assert(release.files.empty?)

      release.add_file(filename, size)

      test "Error is raised" do
        assert proc { release.add_file(filename, size) } do
          raises_error?(Release::FileAddedError)
        end
      end
    end
  end
end
