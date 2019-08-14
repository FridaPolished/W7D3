class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    code = 0
    self.each_with_index do |ele, i|
      code += (ele.hash * i.hash) 
    end
    code
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
