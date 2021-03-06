$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "date_timezone/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "date_timezone"
  s.version     = DateTimezone::VERSION
  s.authors     = ["Shuhei Kagawa"]
  s.email       = ["shuhei.kagawa@gmail.com"]
  s.homepage    = "https://github.com/shuhei/date_timezone"
  s.summary     = "An ActiveRecord concern for assigning date string with timezone"
  s.description = "DateTimezone is an ActiveRecord concern that makes date-type attributes to convert String inputs to Date taking account of the application's timezone."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"

  s.add_development_dependency "sqlite3", "~> 1"
end
