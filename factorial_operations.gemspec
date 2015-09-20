# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factorial_operations/version'

Gem::Specification.new do |spec|
  spec.name          = "factorial_operations"
  spec.version       = FactorialOperations::VERSION
  spec.authors       = ["rribeiro"]
  spec.email         = ["ricardo.costa.ribeiro@gmail.com"]

  spec.summary       = %q{Make factorial operations}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.description = <<END
Provides the following methods:
* Calculate
* FactorialToS
END

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
