# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{slidedown}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat Nakajima", "Dan Croak"]
  s.date = %q{2009-09-24}
  s.default_executable = %q{slidedown}
  s.executables = ["slidedown"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md", "bin/slidedown", "lib/slide.rb", "lib/slidedown.rb", "templates/default.erb", "templates/import.erb", "templates/javascripts/jquery-1.3.2.js", "templates/javascripts/jquery.easing.js", "templates/javascripts/jquery.hash-changed.js", "templates/javascripts/slides.js", "templates/stylesheets/screen.css", "templates/stylesheets/slides.css", "vendor/albino.rb", "spec/commandline_spec.rb", "spec/helper.rb", "spec/slide_spec.rb", "spec/slidedown_spec.rb"]
  s.homepage = %q{http://github.com/nakajima/slidedown}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib", "vendor"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Create slides with Markdown}
  s.test_files = ["spec/commandline_spec.rb", "spec/helper.rb", "spec/slide_spec.rb", "spec/slidedown_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<makers-mark>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<open4>, [">= 0"])
    else
      s.add_dependency(%q<makers-mark>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<open4>, [">= 0"])
    end
  else
    s.add_dependency(%q<makers-mark>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<open4>, [">= 0"])
  end
end
