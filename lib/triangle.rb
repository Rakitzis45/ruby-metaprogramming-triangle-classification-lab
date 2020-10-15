class Triangle
  attr_accessor :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c 
  end

  def kind
    is_triangle
    if a == b && b == c 
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    elsif a != b && a != c && b != c 
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "I am not a triangle"
    end
  end

  def is_triangle
   valid_triangle = [(a + b > c),(a + c > b),(b + c > a)]
   [a, b, c].each do |side| 
    valid_triangle << false if side <= 0
    if valid_triangle.include?(false)
      raise TriangleError
      end
    end
  end 
end
