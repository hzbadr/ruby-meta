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

# class variables belongs to the class heirarchies
# @@v similar to Java's static fields

# when an anonymous class is assigned to a constant, ruby tell the class about the constant
# and set the class name to be that constant.

# singleton methods
# add methoda to a single object.

# class methods are singleton methods of a class

# Class Macros
# Module#attr_*
class Book
  def title
  end
  
  def subtitle
  end

  def lend_to(user)
  end

  def self.deprecated(old_method, new_method)
    define_method(old_method) do |*args, &block|
      warn "Warning ... "
      send(new_method, *args, &block)
    end
  end

  deprecated :XXX_1, :title
  deprecated :XXX_2, :subtitle
  deprecated :XXX_3, :lend_to
end


# Eigenclasses(137)
#The superclass of the eigenclass is the eigenclass of the superclass