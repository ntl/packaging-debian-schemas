module Packaging
  module Debian
    module Schemas
      module SHA256
        def self.call(path)
          digest = ::Digest::SHA256.new

          ::File.open(path) do |io|
            digest << io.read until io.eof?
          end

          digest.hexdigest
        end
      end
    end
  end
end
