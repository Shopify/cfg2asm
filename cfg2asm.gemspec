require_relative 'lib/cfg2asm/version'

Gem::Specification.new do |spec|
  spec.name     = 'cfg2asm'
  spec.version  = Cfg2asm::VERSION
  spec.summary  = 'A tool for disassembling Graal CFG files'
  spec.authors  = ['Chris Seaton']
  spec.homepage = 'https://github.com/Shopify/cfg2asm'
  spec.license = 'MIT'

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/Shopify/cfg2asm/issues",
    "source_code_uri" => "https://github.com/Shopify/cfg2asm",
    "allowed_push_host" => "https://rubygems.org",
  }


  spec.files = `git ls-files bin lib`.split("\n")
  spec.bindir = 'bin'
  spec.executables = %w[cfg2asm]

  spec.required_ruby_version = '>= 2.5.9'

  spec.add_dependency 'crabstone', '~> 4.0'

  spec.add_development_dependency 'rake', '~> 13.0.6'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '= 0.81'
end
