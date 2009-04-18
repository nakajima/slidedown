require 'rubygems'
require 'nokogiri'
require 'rdiscount'
require 'makers-mark'
require 'erb'
require File.join(File.dirname(__FILE__), 'slide')

$SILENT = true

class SlideDown
  attr_reader :classes

  def self.render(args)
    new(File.read(File.join(Dir.pwd, *args))).render
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
    File.read(File.dirname(__FILE__) + '/../templates/%s' % path)
  end

  def render
    template = File.read(File.dirname(__FILE__) + '/../templates/template.erb')
    ERB.new(template).result(binding)
  end

  private

  def lines
    @lines ||= @raw.split(/^!SLIDE\s*([a-z\s]*)$/) \
      .reject { |line| line.empty? }
  end

  def parse_snippets(slide)
    slide.gsub!(/@@@\s([\w\s]+)\s*$/, %(<pre class="#{$1}"><code>))
    slide.gsub!(/@@@\s*$/, %(</code></pre>))
  end

  # These get added to the dom.
  def stylesheets
    Dir[Dir.pwd + '/*.css'].map { |path| File.read(path) }
  end

  def jabascripts
    Dir[Dir.pwd + '/*.js'].map { |path| File.read(path) }
  end

  def extract_classes!
    @classes = []
    @raw.gsub!(/^!SLIDE\s*([a-z\s]*)$/) do |klass|
      @classes << klass.to_s.chomp.gsub('!SLIDE', '')
      "!SLIDE"
    end ; @classes
  end
end
