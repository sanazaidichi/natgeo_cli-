lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "natgeo/version"

Gem::Specification.new do |spec|
  spec.name          = "natgeo"
  spec.version       = NatGeo::VERSION
  spec.authors       = ["sanazaidichi"]
  spec.email         = ["sana.rizvi.5@gmail.com"]

  spec.summary       = %q{National Geographic CLI}
  spec.description   = %q{Shows you the latest news from the National Geographic API within a CLI}
  spec.homepage      = "https://github.com/sanazaidichi/natgeo_cli-"
  spec.license       = "MIT"
  #spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sanazaidichi/natgeo_cli-"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  #spec.bindir        = "exe"
  spec.executables   = ["nationalgeo_cli"]
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 2.0" 
  spec.add_dependency "http"
  spec.add_dependency "pry"
end


# spec.add_development_dependency "bundler", "~> 2.3.0"
# spec.add_development_dependency "rake", "~> 10.0"