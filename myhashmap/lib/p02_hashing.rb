class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.each_with_index.map{|x,idx| [x, idx]}.map{|x| x[0]*x[1]}.sum.hash 
  end
end

class String
  def hash
    self.chars.each_with_index.map{|x, idx| [x, idx]}.map{|x| x[0].ord*x[1]}.sum.hash 
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arr = [] 
    self.keys.each do |key| 
      arr << [key, self[key]]
    end
    arr = arr.sort_by{|x| x[0]}

    arr = arr.map{|x| [x[0].hash, x[1].hash]}

    hash_val = 0 
    arr.each do |subarr|
      hash_val += subarr.hash 
    end 
    
    return hash_val 
  end
end
