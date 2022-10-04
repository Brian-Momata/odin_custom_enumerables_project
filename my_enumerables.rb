module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    while index < self.length
      yield self[index], index
      index += 1
    end
    self
  end

  def my_select
    filtered = []
    self.each do |value|
      filtered << value unless yield(value) == false
    end
    filtered
  end

  def my_all?
    pass = true
    self.each do |value|
      pass = false if yield(value) == false
    end
    pass     
  end

  def my_any?
    pass = false
    self.each do |value|
      pass = true if yield(value) == true
    end
    pass
  end

  def my_none?
    pass = true
    self.each do |value|
      pass = false if yield(value) == true
    end
    pass
  end

  def my_count
    total = 0
    if block_given?
      self.each do |value|
        total += 1 if yield(value) == true
      end
    else
      total = self.size
    end
    total
  end

  def my_map
    new_array = []
    self.each do |value|
      new_array << yield(value)
    end
    new_array
  end

  def my_inject(accumulator)
    self.each do |value|
      accumulator = yield(accumulator, value)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    index = 0
    while index < self.length
      yield self[index]
      index += 1
    end
    self
  end
end
