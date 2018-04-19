require_relative '../automated_init'

context "RFC822" do
  context "Read" do
    control_data = Controls::RFC822::Data.example

    context do
      text = Controls::RFC822::Text.example

      read_data = RFC822.read(text)

      test "Converts to raw data" do
        assert(read_data == control_data)
      end
    end

    context "Comments" do
      text = Controls::RFC822::Text::Comments.example

      read_data = RFC822.read(text)

      test "Converts to raw data" do
        p read_data
        p control_data
        assert(read_data == control_data)
      end
    end

    context "Varied Whitespace" do
      text = Controls::RFC822::Text::VariedWhitespace.example

      read_data = RFC822.read(text)

      test "Converts to raw data" do
        assert(read_data == control_data)
      end
    end

    context "Malformed Text" do
      text = Controls::RFC822::Text::Invalid.example

      test "Raises error" do
        assert proc { RFC822.read(text) } do
          raises_error?(RFC822::ParseError)
        end
      end
    end
  end
end
