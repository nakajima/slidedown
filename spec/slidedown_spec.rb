require File.join(File.dirname(__FILE__), 'helper')

describe 'SlideDown' do
  include TestHelp

  it 'finds slides' do
    with_markdown <<-MD
    |# First
    |
    |!SLIDE
    |
    |# Second
    MD
    slidedown.slides.length.should == 2
  end

  it 'generates HTML from markdown' do
    with_markdown <<-MD
    |!SLIDE
    |# The title
    |!SLIDE
    MD
    Nokogiri::HTML(slidedown.render('default')).at('h1').should_not be_nil
  end

  it 'adds class names to slides' do
    with_markdown <<-MD
    |# This is the title
    |!SLIDE awesome
    |# The title
    MD
    second_slide = Nokogiri::HTML(slidedown.render('default')).search('#track > div')[1]
    second_slide['class'].should include('awesome')
  end
  
  it 'ignores content after !NOTES declaration' do
    with_markdown <<-MD
    |# The Title
    |!NOTES
    |# Some Notes
    |!SLIDE
    |# Another Title
    |!NOTES
    |# More Notes
    |!SLIDE
    |# Yet Another Title
    MD
    
    slidedown.slides.length.should == 3
    
    first_slide = Nokogiri::HTML(slidedown.render('default')).search('#track > div')[0].content
    second_slide = Nokogiri::HTML(slidedown.render('default')).search('#track > div')[1].content
    
    first_slide.should_not include('Some Notes')
    second_slide.should_not include('More Notes')
  end

  # this one is hard
  it 'allows custom lexer' do
    with_markdown <<-MD
    |@@@ js
    |  (function() { })();
    |@@@
    MD
    # slidedown.render('default')
    Nokogiri(slidedown.render('default')).at('.highlight.js').should_not be_nil
  end
end
