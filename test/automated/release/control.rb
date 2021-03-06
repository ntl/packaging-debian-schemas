require_relative '../automated_init'

context "Release" do
  context "Control" do
    context "All Attributes" do
      release = Controls::Release.example

      Release.attribute_names.each do |attribute|
        next if attribute == :files

        test "#{attribute}" do
          control_value = Controls::Release.public_send(attribute)

          value = release.public_send(attribute)

          assert(value == control_value)
        end
      end

      test "Files" do
        files = release.files

        control_files = Controls::Release.files
        refute(control_files[0] == control_files[1])

        assert(files == control_files)
      end
    end

    context "No Attributes" do
      attributes = {}

      Release.attribute_names.each do |attribute|
        attributes[attribute] = :none
      end

      release = Controls::Release.example(**attributes)

      default = Release.new

      release_data = release.to_h

      release_data.each do |attribute, value|
        default_value = default.public_send(attribute)

        test "#{attribute} is set to default value" do
          assert(value == default_value)
        end
      end
    end
  end
end
