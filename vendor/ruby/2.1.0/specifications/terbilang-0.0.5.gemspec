# -*- encoding: utf-8 -*-
# stub: terbilang 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "terbilang".freeze
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Perdana Adhitama".freeze]
  s.date = "2016-05-22"
  s.description = "Konversi bilangan ke dalam string".freeze
  s.email = "perdana_adhitama@yahoo.com".freeze
  s.homepage = "http://rubygems.org/gems/terbilang".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Terbilang!".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
