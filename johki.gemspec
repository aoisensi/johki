require_relative 'lib/johki/version'

Gem::Specification.new do |spec|
  spec.name          = "johki"
  spec.version       = Johki::VERSION
  spec.authors       = ["aoisensi"]
  spec.email         = ["aoisensi@outlook.jp"]

  spec.summary       = %q{Simple Steam Web API Library.}
  spec.description   = %q{Simple Steam Web API Library.}
  spec.homepage      = "https://github.com/aoisensi/johki"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/aoisensi/johki"
  spec.metadata["changelog_uri"] = "https://github.com/aoisensi/johki/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
