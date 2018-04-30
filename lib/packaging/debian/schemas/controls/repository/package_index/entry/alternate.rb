module Packaging
  module Debian
    module Schemas
      module Controls
        module Repository
          module PackageIndex
            module Entry
              module Alternate
                def self.example(filename: nil)
                  data = Data.example(filename: filename)

                  Schemas::Repository::PackageIndex::Entry.build(data)
                end

                module Data
                  extend Entry::Data
                  extend Package::Alternate::Data
                  extend self

                  def self.example(filename: nil)
                    data = {}

                    Entry.attributes.each do |attribute|
                      if attribute == :filename && !filename.nil?
                        value = filename
                      else
                        value = self.public_send(attribute)
                      end

                      data[attribute] = value
                    end

                    data
                  end

                  def size
                    222
                  end

                  def md5sum
                    Digest::MD5::Alternate.example
                  end

                  def sha1
                    Digest::SHA1::Alternate.example
                  end

                  def sha256
                    Digest::SHA256::Alternate.example
                  end

                  def sha512
                    Digest::SHA512::Alternate.example
                  end
                end

                module Text
                  extend Entry::Text
                  extend Entry::Data
                  extend Package::Alternate::Data
                  extend Data

                  extend self

                  def package_text
                    Package::Alternate::Text.example
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
