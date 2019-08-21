# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kuaidiniao/version'

Gem::Specification.new do |spec|
  spec.name          = "kuaidiniao"
  spec.version       = Kuaidiniao::VERSION
  spec.authors       = ["Ricky"]
  spec.email         = ["rickycxj@gmail.com"]

  spec.summary       = %q{An unofficial simple kuaidiniao gem}
  spec.description   = %q{An unofficial simple kuaidiniao gem}
  spec.homepage      = "https://github.com/besonning/kuaidiniao.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "faraday"
end
