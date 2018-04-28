require_relative '../../automated_init'

context "Package" do
  context "Read" do
    context "Malformed" do
      path = Controls::Package::File::Malformed.example

      test "Raises error" do
        assert proc { Package::Read.(path) } do
          raises_error?(Package::Read::Failure)
        end
      end
    end
  end
end
