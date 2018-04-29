module Packaging
  module Debian
    module Schemas
      module Controls
        module Release
          extend Data

          def self.example(**attributes)
            data = Data.example(**attributes)

            Schemas::Release.build(data)
          end

          def self.attributes
            Schemas::Release.attribute_names
          end

          def self.required_attributes
            %i[suite architectures components date files]
          end

          def self.optional_attributes
            attributes - required_attributes
          end

          def self.filename(distribution: nil)
            distribution ||= Suite.example

            "dists/#{distribution}/InRelease"
          end

          def self.files
            [
              File.example,
              Alternate::File.example
            ]
          end
        end
      end
    end
  end
end
