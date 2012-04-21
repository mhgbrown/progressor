module Enumerable

  def each_with_progress(options={}, &block)
    progress_manager = Progressor.new(options)

    each_with_index do |*args|
      block.call(*args)
      progress_manager.update
    end
    progress_manager.finalize
  end

end