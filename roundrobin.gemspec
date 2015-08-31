# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roundrobin/version'

Gem::Specification.new do |spec|
  spec.name          = "roundrobin"
  spec.version       = Roundrobin::VERSION
  spec.authors       = ["Gustavo Garcia", "Sergio Márquez"]
  spec.email         = ["dev@archdaily.com"]
  spec.summary       = "Iterates over an array with a persisted Round-Robin algorithm"
  spec.description   = "Just ask for the next item of a specified array. It will be persisted to a Redis DB"
  spec.homepage      = "http://github.com/archdaily/roundrobin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "redis"

  spec.add_development_dependency "bundler", ">= 1.3.5"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "fakeredis"
  spec.add_development_dependency "rspec"
end
