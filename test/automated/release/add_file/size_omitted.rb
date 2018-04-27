require_relative '../../automated_init'

context "Relase" do
  context "Add File" do
    context "Size Omitted" do
      filename = Controls::Release::File.filename

      release = Release.new

      test "Raises ArgumentError" do
        assert proc { release.add_file(filename) } do
          raises_error?(ArgumentError)
        end
      end
    end
  end
end
