Gem::Specification.new do |s|
  s.name = %q{persevere}
  s.version = "1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ivan R. Judson"]
  s.date = %q{2009-06-24}
  s.description = %q{This gem provides a simple ruby wrapper around the persevere JSON document data store available from http://www.persvr.org.}
  s.email = ["irjudson [a] gmail [d] com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/persevere.rb", "test/test_persevere.rb"]
  s.homepage = %q{http://github.com/irjudson/persevere}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{persevere}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{This gem provides a simple ruby wrapper around the persevere JSON document data store available from http://www.persvr.org.}
  s.test_files = ["test/test_persevere.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.0.0"])
    else
      s.add_dependency(%q<hoe>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.0.0"])
  end
end
