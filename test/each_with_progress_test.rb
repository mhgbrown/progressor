$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'stringio'
require 'test/unit'
require 'each_with_progress'

class EachWithProgressTest < Test::Unit::TestCase
  def setup
    @sample_array = ["foo", "bar"]
    @sample_hash = {:foo => "bar", :baz => "qux"}
  end
  
  def teardown
  end
  
  def test_default
    out = capture_stdout do
      @sample_array.each_with_progress do |element|
        # do something with the element
      end
    end
    
    assert_equal "Processing... 50%\rProcessing... 100%\rProcessing complete\n", out.string
  end
  
  def test_default_with_hash
    out = capture_stdout do
      @sample_hash.each_with_progress do |key, value|
        # do something with the key/value
      end
    end
    
    assert_equal "Processing... 50%\rProcessing... 100%\rProcessing complete\n", out.string
  end
  
  def test_processing_label
    out = capture_stdout do
      @sample_array.each_with_progress(:processing_label => {:text => "Working"}) do |element|
        # do something with the key/value
      end
    end
    
    assert_equal "Working... 50%\rWorking... 100%\rProcessing complete\n", out.string
  end
  
  def test_completion_label
  end
  
  def test_spinner
  end
  
  def test_progress_bar
  end
  
  def test_elements_count
  end
  
  def test_percentage
  end
  
  def test_ellipsis
  end
  
  def test_output_stream
  end
  
  def test_format
  end
  
  private 
  
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end