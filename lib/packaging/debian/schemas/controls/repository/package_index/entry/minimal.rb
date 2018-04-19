module Packaging
  module Debian
    module Schemas
      module Controls
        module Repository
          module PackageIndex
            module Entry
              module Minimal
                def self.example
                  attributes = {}

                  Entry.optional_attributes.each do |attribute|
                    attributes[attribute] = :none
                  end

                  Entry.example(**attributes)
                end

                module Data
                  def self.example
                    {
                      :filename => filename,
                      :size => size
                    }
                  end

                  def self.filename
                    Entry::Data.filename
                  end

                  def self.size
                    Entry::Data.size
                  end
                end

                module Text
                  def self.example
                    <<~TEXT
                      Filename: #{Data.filename}
                      Size: #{Data.size}
                    TEXT
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
