# -*- encoding: utf-8 -*-
# stub: terbilang 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "terbilang"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Perdana Adhitama"]
  s.date = "2016-05-22"
  s.description = "Konversi bilangan ke dalam string bahasa Indonesia"
  s.email = "perdana_adhitama@yahoo.com"
  s.homepage = "https://github.com/kovloq/terbilang"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.5"
  s.summary = "Terbilang!"

  s.installed_by_version = "2.2.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
