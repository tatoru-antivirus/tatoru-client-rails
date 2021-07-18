$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "tatoru/client/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "tatoru-client-rails"
  spec.version     = Tatoru::Client::Rails::VERSION
  spec.authors     = ["BeeGood IT"]
  spec.email       = ["info@beegoodit.de"]
  spec.homepage    = "https://www.tatoru.io"
  spec.summary     = "Tatoru Anti Virus Client."
  spec.license     = "Open source"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6.0"
  spec.add_dependency "tatoru-client"

  spec.add_development_dependency "bootsnap"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rails-dummy"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "sqlite3", "~> 1.4"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
