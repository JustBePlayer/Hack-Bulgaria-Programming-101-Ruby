# Implementation of our own Enumerable class
module MyEnumerable
  def map
    Array.new.tap do |arr|
      each do |element|
        value = yield element
        arr << value
      end
    end
  end

  def filter
    Array.new.tap do |arr|
      each do |element|
        arr << element if (yield element)
      end
    end
  end

  def first
    element = nil

    each do |x|
      element = x
      break
    end

    element
  end

  def reduce(initial = nil)
    skip_first = false

    if initial.nil?
      initial = first
      skip_first = true
    end

    each do |x|
      if skip_first
        skip_first = false
        next
      end
      initial = yield initial, x
    end

    initial
  end

  def negate_block(&block)
    Proc.new { |x| !block.call(x) }
  end

  def reject(&block)
    filter(negate_block(&block))
  end

  def size
    map { |x| 1 }.reduce(0) { |acc, x| acc + x }
  end

  def any?(&block)
    filter(&block).size > 0
  end

  def all?(&block)
    filter(&block).size == size
  end

  def include?(element)
    # Your code goes here
  end

  def count(element = nil)
    if element.nil?
      return size
    end

    filter { |x| x == element }.size
  end


  def min
    min_param = first
    each do |x|
      min_param = x if x < min_param
    end
    min_param
  end

  def min_by
    min_param = first
    each do |element|
      min_param = element if yield(min_param) < yield(element) 
    end
    min_param
  end

  def max
    max_param = first
    each do |x|
      max_param = x if x < max_param
    end
    max_param
  end

  def max_by
    max_param = first
    each do |element|
      max_param = element if yield(max_param) < yield(element) 
    end
    max_param
  end

  def take(n)
    [].tap do |arr|
      each.with_index do |element, index|
        arr << element
        break if index == n - 1
      end
    end
  end

  def take_while
    [].tap do |arr|
      each do |element|
        break if yield element
        arr << element
      end
    end
  end

  def drop(n)
    [].tap do |arr|
      each.with_index do |element, index|
        arr << element if index > n-1
      end
    end
  end

  def drop_while

  end

end

class Collection
  include MyEnumerable

  def initialize(*data)
    @data = data
  end

  def each(&block)
    @data.each(&block)
  end

  def ==(otherCollection)
    @data == otherCollection.data
  end

  def get(index)
    return @data[index]
  end
end

