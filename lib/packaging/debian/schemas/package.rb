module Packaging
  module Debian
    module Schemas
      class Package
        include Schema::DataStructure

        include Attributes
      end
    end
  end
end
