# frozen_string_literal: true

require_relative "lib/id_number_latam/version"

Gem::Specification.new do |spec|
  spec.name          = "id_number_latam"
  spec.version       = IdNumberLatam::VERSION
  spec.authors       = ["Gonzalo Moreno"]
  spec.email         = ["goncab380@hotmail.com"]

  spec.summary       = "Wrapper for id number validators and formatters in LatAm"
  spec.description   = "Supported Countries: Chile, Uruguay, Ecuador, Colombia"
  spec.homepage      = "https://gonzalomoreno.me/id_number_latam"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
