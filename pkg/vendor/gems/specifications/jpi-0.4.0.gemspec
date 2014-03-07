# -*- encoding: utf-8 -*-
# stub: jpi 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jpi"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charles Lowell", "J\u{f8}rgen P. Tjern\u{f8}", "Kohsuke Kawaguchi"]
  s.date = "2014-03-07"
  s.description = "Allows you to generate a new Ruby plugin project, build it, test it in Jenkins and release it to the Jenkins Update Center."
  s.email = ["cowboyd@thefrontside.net"]
  s.executables = ["jpi"]
  s.files = ["bin/jpi"]
  s.homepage = "https://github.com/jenkinsci/jenkins.rb/tree/master/ruby-tools/jpi"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.9"
  s.summary = "Tools for creating and building Jenkins Ruby plugins"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bundler>, [">= 0"])
      s.add_runtime_dependency(%q<thor>, [">= 0"])
      s.add_runtime_dependency(%q<rubyzip>, ["~> 1.1.0"])
      s.add_runtime_dependency(%q<jenkins-war>, ["> 1.427"])
      s.add_runtime_dependency(%q<jenkins-plugin-runtime>, ["~> 0.2.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<aruba>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<thor>, [">= 0"])
      s.add_dependency(%q<rubyzip>, ["~> 1.1.0"])
      s.add_dependency(%q<jenkins-war>, ["> 1.427"])
      s.add_dependency(%q<jenkins-plugin-runtime>, ["~> 0.2.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<aruba>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<thor>, [">= 0"])
    s.add_dependency(%q<rubyzip>, ["~> 1.1.0"])
    s.add_dependency(%q<jenkins-war>, ["> 1.427"])
    s.add_dependency(%q<jenkins-plugin-runtime>, ["~> 0.2.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<aruba>, [">= 0"])
  end
end
