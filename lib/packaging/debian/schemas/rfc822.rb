module Packaging
  module Debian
    module Schemas
      module RFC822
        def self.read(text)
          paragraphs = []

          index = 0

          text = text.dup

          until text.empty?
            next if text.slice!(Patterns.comment)

            paragraphs[index] ||= {}

            current_paragraph = paragraphs[index]

            if text.slice!(Patterns.blank_line)
              index += 1 unless current_paragraph.empty?
              next
            end

            match_data = Patterns.field.match(text)

            if match_data.nil?
              raise ParseError, "Malformed text"
            end

            text.slice!(match_data.to_s)

            field = match_data[:field]
            raw_value = match_data[:value]

            value = String.new

            raw_value.each_line do |line|
              line.strip!

              next if line.empty?

              value.concat(line)
              value.concat("\n")
            end

            value.chomp!

            underscore_field = Casing::Underscore.(field)

            current_paragraph[underscore_field.to_sym] = value
          end

          paragraphs
        end

        def self.write(data)
          data = [data] if data.instance_of?(Hash)

          text = String.new

          data.each_with_index do |paragraph_data, index|
            text << "\n" unless index.zero?

            paragraph_data.each do |field, value|
              value = String(value)

              next if value.empty?

              unless field.instance_of?(String)
                field = Casing::Pascal.(field.to_s)

                field.gsub!(%r{[a-z][A-Z]}) do |str|
                  "#{str[0]}-#{str[1]}"
                end
              end

              text << "#{field}:"

              text << ' ' unless value.match?(%r{\A[[:blank:]]*\n})

              value.each_line.with_index do |line, index|
                text << "\n " unless index.zero?

                text << line.chomp
              end

              text << "\n"
            end
          end

          text
        end

        ParseError = Class.new(StandardError)
      end
    end
  end
end
