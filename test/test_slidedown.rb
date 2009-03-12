require 'rubygems'
require 'nokogiri'
require 'bacon'
require File.join(File.dirname(__FILE__), *%w[.. lib slidedown])

describe 'SlideDown' do
  def slidedown
    SlideDown.new(@markdown)
  end
  
  def with_markdown(markdown)
    @markdown = markdown.gsub(/^\s*\|/, '')
  end
  
  it 'finds slides' do
    with_markdown <<-MD
    |# First
    |
    |!SLIDE
    |
    |# Second
    MD
    slidedown.slides.length.should.equal(2)
  end
  
  it 'generates HTML from markdown' do
    with_markdown <<-MD
    |!SLIDE
    |# The title
    |!SLIDE
    MD
    Nokogiri::HTML(slidedown.render).at('h1').should.not.be.nil
  end
  
  it 'adds class names to slides' do
    with_markdown <<-MD
    |# This is the title
    |!SLIDE awesome
    |# The title
    MD
    second_slide = Nokogiri::HTML(slidedown.render).search('#track > div')[1]
    second_slide['class'].should.include('awesome')
  end
  
  it 'syntax highlights' do
    with_markdown <<-MD
    |
    |    def code
    |      :foo
    |    end
    |
    MD
    Nokogiri::HTML(slidedown.render).at('.highlight.ruby').should.not.be.nil
  end
  
  # this one is hard
  it 'allows custom lexer' do
    with_markdown <<-MD
    |
    |    // example.js
    |
    |    (function() { })();
    |
    MD
    Nokogiri::HTML(slidedown.render).at('.highlight.js').should.not.be.nil
  end
end