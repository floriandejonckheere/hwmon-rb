# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hwmon/version'

Gem::Specification.new do |gem|
  gem.name          = 'hwmon'
  gem.version       = HWMon::VERSION
  gem.summary       = 'Hardware monitor'
  gem.description   = 'Monitor fan speed and temperature'
  gem.license       = 'MIT'
  gem.authors       = ['Florian Dejonckheere']
  gem.email         = 'florian@floriandejonckheere.be'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)

  `git submodule --quiet foreach --recursive pwd`.split($INPUT_RECORD_SEPARATOR).each do |submodule|
    submodule.sub!("#{Dir.pwd}/", '')

    Dir.chdir(submodule) do
      `git ls-files`.split($INPUT_RECORD_SEPARATOR).map do |subpath|
        gem.files << File.join(submodule, subpath)
      end
    end
  end

  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rubocop'
end
