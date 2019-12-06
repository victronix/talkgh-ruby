require File.expand_path('lib/talkgh/version', File.dirname(__FILE__))

Gem::Specification.new do |s|
  s.name = 'talkgh'
  s.version = Talkgh::VERSION
  s.license = 'MIT'
  s.platform = Gem::Platform::RUBY
  s.authors = ['Victor Atinyo']
  s.email = ['vxtechsln@gmail.com']
  s.homepage = 'https://github.com/victronix/talkgh-ruby'
  s.description = 'Talkgh Client Library for Ruby'
  s.summary = 'This is the Ruby client library for Talkgh\'s API. To use it you\'ll need a Talkgh account. Sign up for free at https://www.talkgh.com'
  s.files = Dir.glob('lib/**/*.rb') + %w(LICENSE.txt README.md talkgh.gemspec)
  s.required_ruby_version = '>= 2.1.0'
  s.add_dependency('jwt', '~> 2')
  s.add_development_dependency('rake', '~> 12.0')
  s.add_development_dependency('minitest', '~> 5.0')
  s.add_development_dependency('webmock', '~> 3.0')
  s.add_development_dependency('simplecov', '~> 0.16')
  s.require_path = 'lib'
  s.metadata = {
    'homepage' => 'https://github.com/victronix/talkgh-ruby',
    'source_code_uri' => 'https://github.com/victronix/talkgh-ruby',
    'changelog_uri' => 'https://github.com/victronix/talkgh-ruby/blob/master/CHANGES.md'
  }
end
