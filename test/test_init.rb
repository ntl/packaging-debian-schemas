ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= '_min'

puts RUBY_DESCRIPTION

require_relative '../init.rb'

require 'tempfile'

require 'test_bench'; TestBench.activate

require 'pp'

require 'packaging/debian/schemas/controls'

include Packaging::Debian::Schemas
