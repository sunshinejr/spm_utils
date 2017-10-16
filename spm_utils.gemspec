lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name = 'spm_utils'
  spec.version = SPMFixers::VERSION
  spec.authors = ['Łukasz Mróz']
  spec.email = ['thesunshinejr@gmail.com']
  spec.license = 'MIT'
  spec.summary = 'Bunch of utility scripts for Swift Package Manager.'
  spec.homepage = 'https://github.com/sunshinejr/spm_fixers'
  spec.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.add_dependency 'xcodeproj', '~> 1.0'
  spec.add_dependency 'clamp', '~> 1.0'
  spec.require_paths = ["lib"]
end
