--- !ruby/object:Gem::Specification 
name: slidedown
version: !ruby/object:Gem::Version 
  version: 0.0.7
platform: ruby
authors: 
- Pat Nakajima
autorequire: 
bindir: bin
cert_chain: []

date: 2009-03-10 00:00:00 -04:00
default_executable: slidedown
dependencies: 
- !ruby/object:Gem::Dependency 
  name: rdiscount
  type: :runtime
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: nokogiri
  type: :runtime
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
description: 
email: 
executables: 
- slidedown
extensions: []

extra_rdoc_files: []

files: 
- README.md
- bin/slidedown
- lib/slide.rb
- lib/slidedown.rb
- templates/default.erb
- templates/import.erb
- templates/javascripts
- templates/javascripts/jquery-1.3.2.js
- templates/javascripts/jquery.easing.js
- templates/javascripts/jquery.hash-changed.js
- templates/javascripts/slides.js
- templates/stylesheets
- templates/stylesheets/screen.css
- templates/stylesheets/slides.css
- vendor/albino.rb
has_rdoc: true
homepage: 
licenses: []

post_install_message: 
rdoc_options: []

require_paths: 
- lib
- vendor
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
requirements: []

rubyforge_project: 
rubygems_version: 1.3.3
signing_key: 
specification_version: 2
summary: Create slides with Markdown
test_files: []

