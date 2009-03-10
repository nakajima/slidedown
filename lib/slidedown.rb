require 'rubygems'
require 'nokogiri'
require 'rdiscount'
require 'albino'
require 'erb'

raw = File.read(Dir.pwd + ARGV.first)

@classes = []
raw.gsub!(/^!SLIDE\s*([a-z\s]*)$/) do |klass|
  @classes << klass.to_s.chomp
  "!SLIDE"
end

@slides =  raw.split(/^!SLIDE\s*([a-z\s]*)$/) \
  .reject { |line| line.empty? } \
  .map { |slide| RDiscount.new(slide).to_html } \
  .map do |slide| 
    doc = Nokogiri::HTML(slide)
    
    doc.search('pre code').each do |snippet|
      node = Nokogiri::HTML(Albino.new(snippet.text, :ruby).to_s).at('div')
      snippet.replace(node)
    end
    
    doc.at('body').children.to_s rescue doc.to_s
  end

template = File.read(File.dirname(__FILE__) + '/../templates/template.erb')

puts ERB.new(template).result(binding)