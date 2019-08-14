require "byebug"

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
    @store[num] = [num]
  end

  def remove(num)
    @store[num].delete(num)
  end

  def include?(num)
     @store[num].include?(num)
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
    unless include?(num)
      @store[num] = [num] 
      @count += 1
      true
    end
  end

  def remove(num)
    unless !include?(num)
      @store[num].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    @store[num].include?(num)
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
    if count == num_buckets
      num_buckets = num_buckets * 2
    end
  end
end
