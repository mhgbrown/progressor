require "ostruct"

class Progressor
  
  attr_accessor :options
  
  def initialize(options={})
    @options = OpenStruct.new({
      :processing_label => {:text => "Processing"},
      :completion_label => {:text => "Processing complete"},
      :spinner => {:elements => ["|", "/", "-", "\\"]},
      :progress_bar => {:start => "[", :end => "]", :fill => "=", :length => 20},
      :count => {:include_number => false, :unit => "kbps"},
      :percentage => {:precision => 0},
      :ellipsis => {:animate => false},
      :output_stream => STDOUT,
      :format => "[processing_label][ellipsis] [percentage]"
    }.merge(options))
    
    # for the format, scane the format and compile a lambda that
    # returns a string in the format
  end
  
  def update(increment=1)
  end
  
  def finalize
  end

end

# print "Processing... #{"%.0f" % ((args[-1] + 1.0)/length * 100)}%\r"
# puts "Processing complete"