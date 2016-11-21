# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'biz_directory/version'

Gem::Specification.new do |spec|
  spec.name          = "biz_directory"
  spec.version       = BizDirectory::VERSION
  spec.authors       = ["Brinder Dhaliwal"]
  spec.email         = ["brinder.dhaliwal13@gmail.com"]

  spec.summary       = %q{A Ruby gem wrapper for businesses registered in SF.}
  spec.description   = %q{Directory of businesses that are registered in the city of San Francisco California. }
  spec.homepage      = "https://github.com/jackdhaliwal/biz_directory"
  spec.license       = "MIT"



  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "unirest", "1.1.2"
end
