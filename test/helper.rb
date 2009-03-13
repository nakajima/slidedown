$LOAD_PATH << File.join(File.dirname(__FILE__), *%w[.. lib])

require 'rubygems'
require 'nokogiri'
require 'bacon'
require 'slidedown'

module TestHelp
  def slide(*args)
    Slide.new(@markdown, *args)
  end
  
  def slidedown
    SlideDown.new(@markdown)
  end

  def with_markdown(markdown)
    @markdown = markdown.gsub(/^\s*\|/, '')
  end
end