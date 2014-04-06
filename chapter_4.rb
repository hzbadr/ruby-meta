# using class keyword create an object of type Class
# it's a code that actually runs.

# Module#class_eval

# Class Instance variable
# can be accessed by the class itself
class A
  @x = 5  # => class instance variable

  def self.read_x
    @x # => instance variable
  end
  
  def get_x
    @x
  end

  def set_x=(x)
    @x = x
  end

end
#1) def changes the scope, so we have 2 differen @x 
# first with self as A
# second with self as the object