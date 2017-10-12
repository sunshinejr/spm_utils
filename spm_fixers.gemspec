lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name = 'spm_fixers'
  spec.version = SPMFixers::VERSION
  spec.authors = ['Łukasz Mróz']
  spec.email = ['thesunshinejr@gmail.com']
  spec.summary = 'Bunch of fixer scripts for Swift Package Manager.'
  spec.homepage = 'https://github.com/sunshinejr/spm_fixers'
  spec.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.require_paths = ["lib"]
  spec.executables   = ['spm_fixquick', 'spm_inhibitdepswarnings', 'spm_swift4all']
  spec.add_dependency 'xcodeproj', '~> 1.0'
end
