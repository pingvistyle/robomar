# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'robomar/version'

Gem::Specification.new do |spec|
  spec.name          = "robomar"
  spec.version       = Robomar::VERSION
  spec.authors       = ["Arsen Abalyan"]
  spec.email         = ["arsen.abalyan@gmail.com"]

  spec.summary       = %q{Implementation logics for moving robots on plateau of Mars.}
  spec.description   = %q{Implementation logics for moving robots on plateau of Mars.}
  spec.homepage      = "https://github.com/pingvistyle/robomar"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.executables   = ["robomar"]#spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
