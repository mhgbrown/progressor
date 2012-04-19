module Enumerable
  
  def each_with_progress(options={}, &block)
    options = {
      :processing_label => {:text => "Processing"},
      :completion_label => {:text => "Processing complete"},
      :spinner => {:elements => ["|", "/", "-", "\\"]},
      :progress_bar => {:start => "[", :end => "]", :fill => "="},
      :elements_count => {:include_number => false},
      :percentage => {:precision => 0},
      :ellipsis => {:animate => false},
      :output_stream => STDOUT,
      :format => "[processing_label][ellipsis] [percentage]"
    }.merge(options)
    
    
    each_with_index do |*args|
      block.call(*args)
      print "Processing... #{"%.0f" % ((args[-1] + 1.0)/length * 100)}%\r"
    end
    
    puts "Processing complete"
    
    
    # for the format, scane the format and compile a lambda that
    # returns a string in the format
    
  end

end

# By Default:
# Processing... XXX%
# Processing complete
# Options:
#   Change the processing text, toggle on or off
#   Change completion text, toggle of or off
#   Draw a spinnger, toggle on or off, beginning or end, set the spin elements
#   Draw a progress bar, toggle on or off
#   Use number of items, toggle on or off
#   Use percentage, toggle on or off
#   Toggle elipsis on and off, animate on or off
#   choose a different output stream
#   string.scan /\s*\[[^\[^\]]+\]\s*/