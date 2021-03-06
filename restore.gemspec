# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'restore/version'

Gem::Specification.new do |spec|
  spec.name          = "restore"
  spec.version       = Restore::VERSION
  spec.authors       = ["re5et"]
  spec.email         = ["re5etsmyth@gmail.com"]
  spec.description   = %q{Restore database backups}
  spec.summary       = %q{Restore and process database backups}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'aws-sdk'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
