class Slide
  attr_accessor :text, :classes, :notes

  def initialize(text, *classes)
    @text    = text
    @classes = classes
    @notes   = nil
    
    extract_notes!
  end

  def html
    MakersMark::Generator.new(@text).to_html
  end
  
  private
  
  def extract_notes!
    @text.gsub!(/^!NOTES\s*(.*\n)$/m) do |note|
      @notes = note.to_s.chomp.gsub('!NOTES', '')
      ''
    end
  end
end
