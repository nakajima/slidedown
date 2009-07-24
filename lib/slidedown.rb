require 'rubygems'
require 'optparse'
require 'nokogiri'
require 'makers-mark'
require 'erb'
require File.join(File.dirname(__FILE__), 'slide')

$SILENT = true

class SlideDown
  USAGE = "The SlideDown command line interface takes a .md (Markdown) file as its only required argument. It will convert the file to HTML in standard out. Options:
  -t, --template [TEMPLATE] the .erb files in /templates directory. Default is -t default, which prints stylesheets and javascripts inline. The import template uses link and script tags."

  attr_reader :classes

  def self.run!(argv = ARGV)
    args = argv.dup

    if args.empty?
      puts USAGE
    else
      source = args[0]
      if args.length == 1
        render(source)
      else
        option_parser(source).parse!(args)
      end
    end
  end

  def self.option_parser(source)
    OptionParser.new do |opts|
      opts.on('-h', '--help') { puts USAGE }
      opts.on('-t', '--template TEMPLATE') do |template|
        render(source, template)
      end
    end
  end

  def self.render(source_path, template = "default")
    if source_path
      slideshow = new(File.read(source_path))
      puts slideshow.render(template)
    end
  end

  # Ensures that the first slide has proper !SLIDE declaration
  def initialize(raw)
    @raw = raw =~ /\A!SLIDE/ ? raw : "!SLIDE\n#{raw}"
    extract_classes!
  end

  def slides
    @slides ||= lines.map { |text| Slide.new(text, *@classes.shift) }
  end

  def read(path)
    File.read(File.join(File.dirname(__FILE__), '..', "templates", path))
  end

  def render(name)
    directory = File.join(File.dirname(__FILE__), "..", "templates")
    path      = File.join(directory, "#{name}.erb")
    template  = File.read(path)
    ERB.new(template).result(binding)
  end

  private

  def lines
    @lines ||= @raw.split(/^!SLIDE\s*([a-z\s]*)$/).reject { |line| line.empty? }
  end

  def stylesheets
    Dir[Dir.pwd + '/*.stylesheets'].map { |path| File.read(path) }
  end

  def jabascripts
    Dir[Dir.pwd + '/*.javascripts'].map { |path| File.read(path) }
  end

  def extract_classes!
    @classes = []
    @raw.gsub!(/^!SLIDE\s*([a-z\s]*)$/) do |klass|
      @classes << klass.to_s.chomp.gsub('!SLIDE', '')
      "!SLIDE"
    end
    @classes
  end
end
