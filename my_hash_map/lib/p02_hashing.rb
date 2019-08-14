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
    alphabet = ("a".."z").to_a
    code = 0
    self.each_char.with_index do |char, i|
      alph_idx = alphabet.index(char)
      code = alph_idx.hash * i.hash 
    end
    code
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    keys = self.keys.sort
    vals = self.values.sort
    keys.hash * vals.hash
  end
end
