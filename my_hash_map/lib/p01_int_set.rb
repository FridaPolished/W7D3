class MaxIntSet

  attr_reader :store, :max
  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
     raise "Out of bounds" if !is_valid?(num)
    
    unless store.include?(num) 
      store[num] = true
    end
  end
  
  def remove(num)
    store[num] = false
  end
  
  def include?(num)
    store[num]
  end
  
  private
  
  def is_valid?(num)
     num > 0 && num < max
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
     self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count >= num_buckets
    unless include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
      if self.include?(num)
         self[num].delete(num) 
        @count -= 1
      end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    size = num_buckets
    size *= 2
    prev_store = @store
    @count = 0
    @store = Array.new(size) { Array.new }

    prev_store.flatten.each{|ele| insert(ele)}
  end
end
