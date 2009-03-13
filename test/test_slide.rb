require File.join(File.dirname(__FILE__), 'helper')

describe 'SlideDown' do
  extend TestHelp

  it 'has text' do
    with_markdown <<-MD
    |# foo
    MD
    slide.text.should.include('# foo')
  end
  
  it 'gets class names' do
    with_markdown <<-MD
    |# foo
    MD
    slide('code').classes.should == ['code']
  end
  
  it 'gets html' do
    with_markdown <<-MD
    |# foo
    MD
    Nokogiri(slide.html).at('h1').text.should.equal('foo')
  end
  
  it 'syntax highlights' do
    with_markdown <<-MD
    |@@@ ruby
    |  def foo
    |    :bar
    |  end
    |@@@
    MD
    Nokogiri(slide.html).at('.highlight.ruby').should.not.be.nil
  end
end