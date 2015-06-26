# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: sw2at-capybara 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "sw2at-capybara"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Vitaly Tarasenko"]
  s.date = "2015-06-26"
  s.description = " Gem helps to create capybara tests for pages with a very dynamic content.  "
  s.email = "vetal.tarasenko@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/sw2at-capybara.rb",
    "lib/swat/capybara/config.rb",
    "lib/swat/capybara/exceptions.rb",
    "lib/swat/capybara/helpers.rb",
    "lib/swat/capybara/print_helper.rb",
    "lib/swat/capybara/rspec_setup.rb",
    "sw2at-capybara.gemspec"
  ]
  s.homepage = "http://github.com/tw4qa/sw2at-capybara"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Extension to capybara."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<sourcify>, [">= 0"])
      s.add_runtime_dependency(%q<capybara>, [">= 2.2.0"])
      s.add_runtime_dependency(%q<selenium-webdriver>, [">= 2.43.0"])
      s.add_runtime_dependency(%q<tarvit-helpers>, [">= 0.0.8"])
      s.add_runtime_dependency(%q<pry>, ["~> 0.10.1"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<sourcify>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 2.2.0"])
      s.add_dependency(%q<selenium-webdriver>, [">= 2.43.0"])
      s.add_dependency(%q<tarvit-helpers>, [">= 0.0.8"])
      s.add_dependency(%q<pry>, ["~> 0.10.1"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<sourcify>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 2.2.0"])
    s.add_dependency(%q<selenium-webdriver>, [">= 2.43.0"])
    s.add_dependency(%q<tarvit-helpers>, [">= 0.0.8"])
    s.add_dependency(%q<pry>, ["~> 0.10.1"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

