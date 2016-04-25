# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gcloud/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "gcloud-cli"
  spec.version       = Gcloud::Cli::VERSION
  spec.authors       = ["Arturo Pie"]
  spec.email         = ["arturop@nulogy.com"]
  spec.summary       = %q{GCloud client.}
  spec.description   = %q{This llibrary is used to communicate and authenticate with GCloud service.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json"
  spec.add_dependency "rest-client", "~> 1.7"
  spec.add_dependency "highline"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
end
