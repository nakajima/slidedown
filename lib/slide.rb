class Slide
  attr_accessor :text, :classes
  
  def initialize(text, *classes)
    @text = text
    @classes = classes
    highlight!
  end
  
  def html
    @doc.at('body *').to_s
  end
  
  private
  
  def markup
    @markup ||= begin
      self.text = text.split(/\n/).each do |line|
        line.gsub!(/^@@@ ([\w\s]+)/) do
          %(<pre><code rel='#{$1}'>)
        end
        line.gsub!(/^@@@\s*$/, %(</code></pre>))
      end.join("\n")
      RDiscount.new(text).to_html
    end
  end
  
  def highlight!
    doc.search('pre code').each do |node|
      lexer = node['rel'] || :ruby
      lexted_text = Albino.new(node.text, lexer).to_s
      highlighted = Nokogiri::HTML(lexted_text).at('div')
      
      klasses = highlighted['class'].split(/\s+/)
      klasses << lexer
      highlighted['class'] = klasses.join(' ')
      
      node.replace(highlighted)
    end
  end
  
  def doc
    @doc ||= Nokogiri::HTML(markup)
  end
  
  alias_method :to_str, :html
end