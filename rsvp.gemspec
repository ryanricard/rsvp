$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rsvp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rsvp"
  s.version     = Rsvp::VERSION
  s.authors     = ["Ryan Ricard"]
  s.email       = ["hi@ryanricard.com"]
  s.homepage    = "github.com/ryanricard/rsvp"
  s.summary     = "RSVP is a Rails mountable engine that collects RSVP responses online."
  s.description = "RSVP is a Rails mountable engine that collects RSVP responses online."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency "debugger"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "database_cleaner"
end
