# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roundrobin/version'

Gem::Specification.new do |spec|
  spec.name          = "roundrobin"
  spec.version       = Roundrobin::VERSION
  spec.authors       = ["Gustavo Garcia", "Sergio Márquez"]
  spec.email         = ["smarquezs@gmail.com"]
  spec.summary       = "Iterates over an array with a persisted Round-Robin algorithm"
  spec.description   = "Set the array in a yml file and then just ask for the next item"
  spec.homepage      = "http://github.com/pnet/roundrobin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
