# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attr_lazy_reader/version'

Gem::Specification.new do |spec|
  spec.name          = "attr_lazy_reader"
  spec.version       = AttrLazyReader::VERSION
  spec.authors       = ["maisumakun"]
  spec.email         = ["maisumakun@users.noreply.github.com"]

  spec.summary       = %q{Lazily initialized attr_reader.}
  spec.homepage      = "https://github.com/maisumakun/attr_lazy_reader"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
