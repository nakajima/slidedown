class Slide
  attr_accessor :text, :classes

  def initialize(text, *classes)
    @text    = text
    @classes = classes
  end

  def html
    MakersMark::Generator.new(@text).to_html
  end
end
