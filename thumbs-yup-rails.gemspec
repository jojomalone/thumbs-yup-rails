# coding: utf-8
#lib = File.join(File.dirname(__FILE__), 'lib')
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
puts "*************** IN GEMSPEC 1"

$:.push File.expand_path("../lib", __FILE__)
require "thumbs_yup_rails/version"
require 'thumbs_yup_rails/configuration'
require 'thumbs_yup_rails'
require 'thumbs_yup_rails/railtie'# if defined? ::Rails::Railtie


puts "*************** IN GEMSPEC 2"

Gem::Specification.new do |spec|
  spec.name          = "thumbs-yup-rails"
  spec.version       = Thumbs::Yup::Rails::VERSION
  spec.authors       = ["Jomana Malone", "Scott Malone"]
  spec.email         = ["jomana.malone@gmail.com", "scottmalone101@gmail.com"]

  spec.summary       = %q{ThumbsYup review integration.}
  spec.description   = %q{Creates the HTML, styling, javascript and review data necessary to embed reviews in a website.}
  spec.homepage      = "https://github.com/jojomalone/thumbs-yup-rails"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  #spec.add_development_dependency "pry"
  #spec.add_development_dependency "rails"
end
