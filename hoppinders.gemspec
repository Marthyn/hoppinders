# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'hoppinders/version'
require 'date'

Gem::Specification.new do |s|
  s.required_ruby_version = ">= #{Hoppinders::RUBY_VERSION}"
  s.authors = ['thoughtbot']
  s.date = Date.today.strftime('%Y-%m-%d')

  s.description = <<-HERE
Hoppinders is a base Rails project that you can upgrade. It is used by
thoughtbot to get a jump start on a working app. Use Hoppinders if you're in a
rush to build something amazing; don't use it if you like missing deadlines.
  HERE

  s.email = 'info@hoppinger.com'
  s.executables = ['hoppinders']
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/thoughtbot/hoppinders'
  s.license = 'MIT'
  s.name = 'hoppinders'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.summary = "Generate a Rails app using thoughtbot's best practices."
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Hoppinders::VERSION

  s.add_dependency 'bundler', '~> 1.3'
  s.add_dependency 'rails', Hoppinders::RAILS_VERSION

  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'bitters', '~> 1.2'
  s.add_development_dependency 'simple_form', '~> 3.2'
  s.add_development_dependency 'title', '~> 0.0'
  s.add_development_dependency 'quiet_assets', '~> 1.1'
  s.add_development_dependency 'capybara-webkit', '~> 1.8'
end
