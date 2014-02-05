$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rsvp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rsvp"
  s.version     = Rsvp::VERSION
  s.licenses    = ['MIT']
  s.authors     = ["Ryan Ricard"]
  s.email       = ["hi@ryanricard.com"]
  s.homepage    = "http://github.com/ryanricard/rsvp"
  s.summary     = "Rsvp is a Rails mountable engine to collects online RSVP responses."
  s.description = "Provides wrapping application necessary views and data structures to capture online RSVP responses."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_runtime_dependency "rails", "~> 4.0", ">= 4.0.2"

  s.add_development_dependency "sqlite3", "~> 0"

  s.add_development_dependency "debugger", "~> 1.6", ">= 1.6.5"
  s.add_development_dependency "rspec-rails", "~> 2.14", ">= 2.14.1"
  s.add_development_dependency "capybara", "~> 2.2", ">= 2.2.1"
  s.add_development_dependency "selenium-webdriver", "~> 2.39", ">= 2.39.0"
  s.add_development_dependency "database_cleaner", "~> 1.2", ">= 1.2.0"
end
