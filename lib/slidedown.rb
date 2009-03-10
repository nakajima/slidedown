require 'rubygems'
require 'nokogiri'
require 'rdiscount'
require 'albino'
require 'erb'

class SlideDown
  attr_reader :classes
  
  def initialize(args)
    @raw = File.read(File.join(Dir.pwd, *args))
    extract_classes!
  end
  
  def slides
    @slides ||= lines \
      .reject { |line| line.empty? } \
      .map { |slide| RDiscount.new(slide).to_html } \
      .map { |slide| highlight(slide) }
  end
  
  def read(path)
    File.read(File.dirname(__FILE__) + '/../templates/%s' % path)
  end
  
  def render
    template = File.read(File.dirname(__FILE__) + '/../templates/template.erb')
    puts ERB.new(template).result(binding)
  end
  
  private
  
  def highlight(slide)
    doc = Nokogiri::HTML(slide)

    doc.search('pre code').each do |snippet|
      node = Nokogiri::HTML(Albino.new(snippet.text, :ruby).to_s).at('div')
      snippet.replace(node)
    end

    doc.at('body').children.to_s rescue doc.to_s
  end
  
  def lines
    @lines ||= @raw.split(/^!SLIDE\s*([a-z\s]*)$/)
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