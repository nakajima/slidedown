require 'rake'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
end

desc 'Default: run the specs.'
task :default => :spec

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name        = "slidedown"
    gemspec.summary     = "Create slides with Markdown"
    gemspec.homepage    = "http://github.com/nakajima/slidedown"
    gemspec.authors     = ["Pat Nakajima", "Dan Croak"]
    gemspec.executables = ["slidedown"]

    gemspec.require_paths = ["lib", "vendor"]
    gemspec.files         = FileList["README.md",
                                     "{bin,lib,templates,vendor}/**/*"]

    if gemspec.respond_to? :specification_version
      current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
      gemspec.specification_version = 2

      if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0')
        gemspec.add_runtime_dependency(%q<makers-mark>, [">= 0"])
        gemspec.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      else
        gemspec.add_dependency(%q<makers-mark>, [">= 0"])
        gemspec.add_dependency(%q<nokogiri>, [">= 0"])
      end
    else
      gemspec.add_dependency(%q<makers-mark>, [">= 0"])
      gemspec.add_dependency(%q<nokogiri>, [">= 0"])
    end
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

