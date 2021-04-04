# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'extensobr/version'

Gem::Specification.new do |spec|
  spec.name          = "extensobr"
  spec.version       = Extensobr::VERSION
  spec.authors       = ["Henrique Max"]
  spec.email         = ["rickmaxg3@hotmail.com"]

  spec.summary       = %q{ExtendoBr escreve números e moeda por extenso.}
  spec.description   = %q{ExtensoBr é uma gem que foi desenvolvida para auxiliar na impressão de números e moedas por extenso em portugês do Brasil.}
  spec.homepage      = "https://github.com/rickmax/extensobr"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 2.2.15"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec"
end
