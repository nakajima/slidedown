require File.join(File.dirname(__FILE__), 'helper')
require 'tempfile'
require 'ftools'

describe 'slidedown commandline tool' do
  include TestHelp

  it "converts MD to HTML" do
    run_slidedown
    result_file_content.should == reference_file_content
  end

  it "accepts -t template-filename" do
    run_slidedown("-t import")
    result_file_content.should == reference_file_content("slides-import")
  end

  it "defaults to default template" do
    run_slidedown("-t default")
    result_file_content.should == reference_file_content
  end

  it "accepts -t /full/path/to/template-filename" do
    import_template_path = File.join(root_path, 'templates', 'import.erb')
    other_template_path  = Tempfile.new("slidedown-template").path
    File.copy(import_template_path, "#{other_template_path}.erb")

    run_slidedown("-t #{other_template_path}")

    result_file_content.should == reference_file_content("slides-import")
  end

  def run_slidedown(opts = "")
    `#{slidedown_path} #{source_path} #{opts} > #{result_file_path}`
  end

  def slidedown_path
    File.join(root_path, 'bin', 'slidedown')
  end

  def source_path
    File.join(root_path, 'example', 'slides.md')
  end

  def root_path
    File.join(File.dirname(__FILE__), '..')
  end

  def reference_file_content(basename = 'slides')
    open(reference_file_path(basename)).read
  end

  def reference_file_path(basename = 'slides')
    File.join(root_path, 'example', "#{basename}.html")
  end

  def result_file_content
    open(result_file_path).read
  end

  def result_file_path
    @result_file_path_for_current_test ||= Tempfile.new("slidedown-specs").path
  end
end
