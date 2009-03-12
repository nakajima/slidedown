require 'rubygems'
require 'nokogiri'
require 'rdiscount'
require 'albino'
require 'erb'

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
    @slides ||= lines.map do |slide|
      codes = Nokogiri::HTML(slide)
      codes.search('pre code').each { |s| highlight(s) }
      codes.at('body *').to_s
    end
  end
  
  def read(path)
    File.read(File.dirname(__FILE__) + '/../templates/%s' % path)
  end
  
  def render
    template = File.read(File.dirname(__FILE__) + '/../templates/template.erb')
    ERB.new(template).result(binding)
  end
  
  private
  
  def highlight(snippet, lexer='ruby')
    node = Nokogiri::HTML(Albino.new(snippet.text, lexer).to_s).at('div')
    klasses = node['class'].split(/\s+/)
    klasses << lexer
    node['class'] = klasses.join(' ')

    snippet.replace(node)
  end
  
  def lines
    @lines ||= @raw.split(/^!SLIDE\s*([a-z\s]*)$/) \
      .reject { |line| line.empty? } \
      .map { |slide| RDiscount.new(slide).to_html }
  end
  
  # These get added to the dom.
  def stylesheets
    Dir[Dir.pwd + '/*.css'].map { |path| File.read(path) }
  end
  
  def extract_classes!
    @classes = []
    @raw.gsub!(/^!SLIDE\s*([a-z\s]*)$/) do |klass|
      @classes << klass.to_s.chomp.gsub('!SLIDE', '')
      "!SLIDE"
    end ; @classes
  end
end