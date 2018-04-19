module Packaging
  module Debian
    module Schemas
      class Package
        module Attributes
          def self.included(cls)
            cls.class_exec do
              attribute :package, String
              attribute :source, String
              attribute :version, String
              attribute :section, String
              attribute :priority, String
              attribute :architecture, String
              attribute :essential
              attribute :depends, String
              attribute :pre_depends, String
              attribute :recommends, String
              attribute :suggests, String
              attribute :enhances, String
              attribute :breaks, String
              attribute :conflicts, String
              attribute :installed_size, Integer
              attribute :maintainer, String
              attribute :description, String
              attribute :homepage, String
              attribute :built_using, String

              alias_method :name, :package
            end
          end
        end
      end
    end
  end
end
