require "ostruct"

class Progressor
  
  attr_accessor :options
  attr_reader :formatter, :count
  
  def initialize(options={})
    @options = OpenStruct.new({
      :processing_text => "Processing",
      :completion_text => "Processing complete",
      :spinner => ["|", "/", "-", "\\"],
      :progress_bar => {:start => "[", :end => "]", :fill => "=", :length => 20},
      :count => {:include_number => false, :unit => "kbps"},
      :percentage => {:precision => 0},
      :ellipsis => {:animate => false},
      :output_stream => STDOUT,
      :format => "[processing_label][ellipsis] [percentage]",
      :size => nil
    }.merge(options))
    
    # for the format, scan the format and compile a lambda that
    # returns a string in the format
  end
  
  def update(increment=1)
  end
  
  def finalize
    puts options.completion_text
  end

end

# print "Processing... #{"%.0f" % ((args[-1] + 1.0)/length * 100)}%\r"
# puts "Processing complete"