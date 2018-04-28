# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'packaging-debian-schemas'
  s.version = '0.0.0.0'
  s.summary = 'Schemas for Debian package management control files'
  s.description = ' '

  s.authors = ['BTC Labs']
  s.email = ' '
  s.homepage = 'https://github.com/btc-labs/packaging-debian-schemas'
  s.licenses = ['Proprietary']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4.0'

  s.add_runtime_dependency 'evt-casing'
  s.add_runtime_dependency 'evt-configure'
  s.add_runtime_dependency 'evt-schema'
  s.add_runtime_dependency 'evt-transform'

  s.add_development_dependency 'test_bench'
end
