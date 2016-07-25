# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'propinsi/version'

Gem::Specification.new do |spec|
  spec.name          = "propinsi"
  spec.version       = Propinsi::VERSION
  spec.authors       = ["Perdana Adhitama"]
  spec.email         = ["perdana_adhitama@yahoo.com"]

  spec.summary       = "Propinsi master table"
  spec.description   = "Propinsi master table"
  spec.homepage      = "http://github.com/kovloq/propinsi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

end
