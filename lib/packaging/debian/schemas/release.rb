module Packaging
  module Debian
    module Schemas
      class Release
        include Schema::DataStructure

        attribute :suite, String
        attribute :codename, String
        attribute :architectures, Array, default: proc { Array.new }
        attribute :components, Array, default: proc { Array.new }
        attribute :date, Time
        attribute :sha256, String

        attribute :description, String
        attribute :origin, String
        attribute :label, String
        attribute :version, String

        attribute :valid_until, Time
        attribute :md5sum, String
        attribute :sha1, String

        attribute :not_automatic
        attribute :but_automatic_upgrades
        attribute :acquire_by_hash

        attribute :signed_by, String
      end
    end
  end
end
