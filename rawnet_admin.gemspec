$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rawnet_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rawnet_admin"
  s.version     = RawnetAdmin::VERSION
  s.authors     = ["Tom Beynon"]
  s.email       = ["tbeynon@rawnet.com"]
  s.homepage    = "http://rawnet.com"
  s.summary     = "Provides the base classes and views for a Rawnet admin interface"
  s.description = "Provides the base classes and views for a Rawnet admin interface"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 4.2.0'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'sass-rails', '>= 3.2'
  s.add_dependency 'has_scope'
  s.add_dependency 'responders'
  s.add_dependency 'active_link_to'
  s.add_dependency 'kaminari'
  s.add_dependency 'bootstrap-sass', '~> 3.3.3'
  s.add_dependency 'bootstrap-kaminari-views'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "spring"
  s.add_development_dependency "spring-commands-rspec"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
end
