require_relative '../automated_init'

context "RFC822" do
  context "Single Paragraph" do
    control_data = Controls::RFC822::Data::SingleParagraph.example
    control_text = Controls::RFC822::Text::SingleParagraph.example

    context "Read" do
      context do
        data = RFC822::SingleParagraph.read(control_text)

        test "Converts to raw data" do
          assert(data == control_data)
        end
      end

      context "Contains Multiple Paragraphs" do
        multiple_paragraph_text = Controls::RFC822::Text.example

        test "Raises error" do
          assert proc { RFC822::SingleParagraph.read(multiple_paragraph_text) } do
            raises_error?(RFC822::SingleParagraph::MultipleParagraphsError)
          end
        end
      end
    end

    context "Write" do
      context do
        text = RFC822::SingleParagraph.write(control_data)

        test "Converts to text" do
          assert(text == control_text)
        end
      end

      context "Single Paragraph Within Array" do
        text = RFC822::SingleParagraph.write([control_data])

        test "Converts to text" do
          assert(text == control_text)
        end
      end

      context "Contains Multiple Paragraphs" do
        multiple_paragraph_data = Controls::RFC822::Data.example

        test "Raises error" do
          assert proc { RFC822::SingleParagraph.write(multiple_paragraph_data) } do
            raises_error?(RFC822::SingleParagraph::MultipleParagraphsError)
          end
        end
      end
    end
  end
end
