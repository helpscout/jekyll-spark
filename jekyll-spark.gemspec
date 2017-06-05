# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/spark/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-spark"
  spec.version       = Jekyll::Spark::VERSION
  spec.authors       = ["ItsJonQ"]
  spec.email         = ["itsjonq@gmail.com"]

  spec.summary       = "A Jekyll library for building component-based UI"
  spec.homepage      = "https://github.com/helpscout/jekyll-spark"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("jekyll", ">= 3.1.2")
  spec.add_runtime_dependency("htmlcompressor", "~> 0.3.1")

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "minitest-profile"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "nokogiri", "~> 1.7.1"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "jekyll-joule"
  spec.add_development_dependency "shoulda"
  spec.add_development_dependency "kramdown"
end
