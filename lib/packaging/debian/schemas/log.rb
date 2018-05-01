module Packaging
  module Debian
    module Schemas
      class Log < ::Log
        def tag!(tags)
          tags << :packaging_debian_schemas
          tags << :packaging
          tags << :library
          tags << :verbose
        end
      end
    end
  end
end
