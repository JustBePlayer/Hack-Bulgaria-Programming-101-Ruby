class Vector2D
  def initialize(x, y)
    @x, @y = x, y
  end

  def x
    @x
  end

  def x=(value)
    @x = value
  end

  def y
    @y
  end

  def y=(value)
    @y = value
  end

  def length
    Math.sqrt @x ** 2 + @y ** 2
  end

  def normalize
    Vector2D.new @x / length, @y / length
  end

  def ==(other)
    @x == other.x and @y == other.y
  end

  def +(other)
    # Return a new Vector2D that represents the result
    Vector2D.new @x + other.x, @y + other.y
  end

  def -(other)
    # Return a new Vector2D that represents the result
     Vector2D.new @x - other.x, @y - other.y
  end

  def *(scalar)
    # Return a new Vector2D that represents the result
     Vector2D.new @x * scalar, @y * scalar
  end

  def /(scalar)
    # Return a new Vector2D that represents the result
     Vector2D.new @x / scalar, @y / scalar
  end

  def dot(other)
    # Return the dot product of the two vectors
    # https://en.wikipedia.org/wiki/Dot_product#Algebraic_definition
    @x * other.x + @x * other.y + @y * other.x + @y * other.y 
  end

  def to_s
    "(#{@x}, #{@y} ->)"
  end
end


class Vector
  def initialize(*components)
    # Let's make it more interesting here. I wanna initialize the vector with
    # `Vector.new(1, 2, 3, 4)` and `Vector.new([1, 2, 3, 4])` and expect the
    # same vector.
    #raise ArgumentError, "Too many arguments" if components.length > 4
    @coordinates = components.flatten
    #components.flatten.each { |number| @coordinates.push number }
  end
  def coordinates
    @coordinates
  end

  def dimension
    @coordinates.length
  end

  def length
    Math.sqrt @coordinates.map { |number| number ** 2 }.reduce(:+)
  end

  def normalize
    @coordinates.map! { |number| number / length }
  end

  def [](index)
    @coordinates[index]
  end

  def []=(index, value)
    @coordinates[index] = value
  end

  def ==(other)
    dimension_chek other
    @coordinates.each_with_index do |number, index|
      return false if number != other[index]
    end
      true
  end

  def +(vector_of_same_dimension_or_scalar)
    dimension_chek vector_of_same_dimension_or_scalar
      coordinates.each_with_index.map! do |number, index|
        number + vector_of_same_dimension_or_scalar[index]
      end
  end

  def -(vector_of_same_dimension_or_scalar)
    dimension_chek vector_of_same_dimension_or_scalar
      coordinates.each_with_index.map! do |number, index|
        number - vector_of_same_dimension_or_scalar[index]
      end
  end

  def *(scalar)
    dimension_chek vector_of_same_dimension_or_scalar
      coordinates.each_with_index.map! do |number, index|
        number * vector_of_same_dimension_or_scalar[index]
      end
  end

  def /(scalar)
    # Return a new Vector that represents the result
    # Your code goes here.
  end

  def dot(vector_of_same_dimension_or_scalar)
    # Return the dot product of the two vectors
    # https://en.wikipedia.org/wiki/Dot_product#Algebraic_definition
  end

  def to_s
    @coordinates.join(',')
  end

  private def dimension_chek (other)
    raise ArgumentError, "Too many arguments" if @coordinates.length != other.coordinates.length
  end
end
