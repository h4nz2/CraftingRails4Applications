$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "pdf_renderer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pdf_renderer"
  s.version     = PdfRenderer::VERSION
  s.authors     = ["Jan"]
  s.email       = ["secret"]
  s.homepage    = ""
  s.summary     = "chapter 1"
  s.description = "it does things"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"
  s.add_dependency "prawn", "0.12.0"

  s.add_development_dependency "sqlite3"
end