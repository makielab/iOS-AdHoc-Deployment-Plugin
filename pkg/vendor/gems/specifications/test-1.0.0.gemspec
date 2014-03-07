# -*- encoding: utf-8 -*-
# stub: test 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "test"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["trans"]
  s.date = "2012-12-24"
  s.description = "The Test library/repository/gem is a testbed project, for use by\nany other project that needs an external project to test itself\nagainst. Fee free to make requests for additions to this project\nto help you test your project."
  s.email = ["transfire@gmail.com"]
  s.extra_rdoc_files = ["HISTORY.md", "README.md"]
  s.files = ["HISTORY.md", "README.md"]
  s.homepage = "http://github.com/rubyworks/test"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.9"
  s.summary = "Testbed project"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubytest>, [">= 0"])
      s.add_development_dependency(%q<indexer>, [">= 0"])
    else
      s.add_dependency(%q<rubytest>, [">= 0"])
      s.add_dependency(%q<indexer>, [">= 0"])
    end
  else
    s.add_dependency(%q<rubytest>, [">= 0"])
    s.add_dependency(%q<indexer>, [">= 0"])
  end
end
