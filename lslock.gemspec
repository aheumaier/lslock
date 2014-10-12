# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lslock/version'

Gem::Specification.new do |spec|
  spec.name          = "lslock"
  spec.version       = Lslock::VERSION
  spec.authors       = ["A. Heumaier"]
  spec.email         = ["developer@andreasheuamier.de"]
  spec.description   = %q{Show all PID's which held a lock on files in a given directory}
  spec.summary       = %q{Show all PID's which held a lock on files in a given directory}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
