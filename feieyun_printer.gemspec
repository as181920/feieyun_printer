require_relative 'lib/feieyun_printer/version'

Gem::Specification.new do |spec|
  spec.name          = "feieyun_printer"
  spec.version       = FeieyunPrinter::VERSION
  spec.authors       = ["Andersen Fan"]
  spec.email         = ["as181920@gmail.com"]

  spec.summary       = %q{feieyun printer api client}
  spec.description   = %q{print ticket like shop order and so on.}
  spec.homepage      = "https://github.com/as181920/feieyun_printer"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/as181920/feieyun_printer"
  spec.metadata["changelog_uri"] = "https://github.com/as181920/feieyun_printer"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport"
  spec.add_dependency "faraday"
end
