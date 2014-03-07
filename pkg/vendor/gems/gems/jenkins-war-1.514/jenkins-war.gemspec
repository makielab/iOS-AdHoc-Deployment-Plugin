# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jenkins-war"
  s.version = "1.514"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charles Lowell"]
  s.date = "2013-05-05"
  s.description = "download and install a specific version of the jenkins war file which can be used for either running a server, or for plugin development"
  s.email = ["cowboyd@thefrontside.net"]
  s.executables = ["jenkins.war"]
  s.files = ["lib", "lib/jenkins", "lib/jenkins/jenkins.war", "lib/jenkins/war.rb", "jenkins-war.gemspec", "bin", "bin/jenkins.war"]
  s.homepage = "http://rubygems.org/gems/jenkins-war"
  s.require_paths = ["lib"]
  s.rubyforge_project = "jenkins-war"
  s.rubygems_version = "1.8.25"
  s.summary = "fetch and use a specific jenkins version with rubygems"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
