$LOAD_PATH << File.join(File.dirname(__FILE__), *%w[.. lib])

require 'rubygems'
require 'nokogiri'
require 'spec'
require File.join(File.dirname(__FILE__), *%w[.. lib slidedown])

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