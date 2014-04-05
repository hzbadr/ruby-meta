## Open Classes

# 1) Open Standard Library classes for modification.

class String
  def to_alphanumeric
    gsub /[^\w\s]/, ''
  end
end

# 2) Not another class definition.
class D
  def x; 'x'; end
end

class D
  def y; 'y'; end
end

obj = D.new

obj.x => "x"
obj.y => "y"

# class keyword is more like a scope operator than a class declaration.

# 3) Make sure not to override existing methods (Monkeypatch) by mistake 
class Array
  def replace(from, to)
    each_with_index do|i, e|
      self[i] = to if e == from
    end
  end
end

# objects that share the same classes share the same methods,
# so the methods must be stored in class, not the object

String.instance_methods == "abc".methods   # => true
String.methods == "abc".methods            # => false

# classes are objects!
# class names are constants

String.superclass # => Object
Object.superclass # => BasicObject
BasicObject.superclass # => nil

Class.superclass  # => Module
Module.superclass # => Object

# Modules
module M
  Y = 'another constant'
  class C
    ::M::Y
  end
end

# Module.constants & Module#constants 
# Module.nesting

# calling a method
# a) lookup
# b) execute

# receiver is the object you call a method on.
# ancestors chain
A.ancestors # => [A, Object, Kernel, BasicObject] 
# Kernel Module is included into Object class


# Discovering self

# private methods must be called on the implicit receiver

class C
  def public_method
    self.private_method
  end

  private
    def private_method
    end
end

C.new.public_method
# NoMethodError: private method ‘private_method' called [...]
# to make it works remove the explicit self keyword.

# Not calling the right method
module Printable
  def print
    # ...
  end

  def prepare_cover
    # ...
  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end
  
  def format_for_screen
    # ...
  end
  
  def print
    # ...
  end
end

class Book
  include Document
  include Printable
  # ...
end

Book.ancestors # => [Book, Printable, Document, Object, Kernel, BasicObject]
# sawp the module includes to fix the issue