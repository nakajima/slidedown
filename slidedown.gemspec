# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{slidedown}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat Nakajima"]
  s.date = %q{2009-03-10}
  s.default_executable = %q{slidedown}
  s.executables = ["slidedown"]
  s.files = %W[
    bin/
    bin/slidedown
    lib/
    lib/slidedown.rb
    README.md
    templates/css
    templates/css/screen.css
    templates/css/slides.css
    templates/js
    templates/js/jquery-1.3.2.js
    templates/js/jquery.easing.js
    templates/js/jquery.hash-changed.js
    templates/js/slides.js
    templates/template.erb
    vendor
    vendor/albino.rb
  ]
  s.require_paths = ["lib", "vendor"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Create slides with Markdown}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rdiscount>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
    else
      s.add_dependency(%q<rdiscount>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
    end
  else
    s.add_dependency(%q<rdiscount>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
  end
end
