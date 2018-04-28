module Packaging
  module Debian
    module Schemas
      class Package
        class Read
          include Log::Dependency

          configure :read_package

          def self.call(path)
            instance = new
            instance.(path)
          end

          def call(path)
            logger.trace { "Reading package metadata (Path: #{path})" }

            package = Package.new

            command = %W[
              dpkg-deb -f #{path}
            ]

            stdout_text, stderr_text, status = Open3.capture3(*command)

            unless status.success?
              exit_code = status.exitstatus

              error_message = "Package metadata read failed (Path: #{path}, Exit Code: #{exit_code})"

              logger.error { error_message }
              logger.error(tag: :data) { stderr_text }

              raise Failure, error_message
            end

            package = ::Transform::Read.(stdout_text, :rfc822, Package)

            logger.info { "Package metadata read (Path: #{path}, Package: #{package.package}, Version: #{package.version})" }

            package
          end

          Failure = Class.new(StandardError)
        end
      end
    end
  end
end
