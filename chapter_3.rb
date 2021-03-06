#Blocks
# yield, Kernel#block_given?

module Kernel
  def using(resource)
    begin
      yield
    ensure
      resource.dispose
    end
  end
end

# using(r){}
# using(r){ raise Exception }

# in all cases, the dispose methods is going to be called on the resource.

def my_method
  x = 'Goodbye'
  yeild("cruel")
end

x = 'Hello'
my_method {|y| "#{{x}}. #{y} world"}  # => "Hello, cruel world"

# variables inside blocks are those who are within the same context that the block was defined, not the execution context.
# block captures the local bindings.


# Scope
# Whenever a program changes scope,some bindings are replaced by a new set of bindings.
# Local variables change ar every new scope. (LOCAL!)

# Scope Gates (class, module, def)
# 1) class definition
# 2) Module definition
# 3) Methods

# Flatten the Scope

my_var = "Success"
MyClass = Class.new do
  puts "#{my_var} in the class definition!"

  def my_method
    ## ... how to print here?
  end
end

# solution

my_var = "Success"
MyClass = Class.new do
  puts "#{my_var} in the class definition!"

  define_method :my_method do
    puts "#{my_var} in the method!"    
  end
end

MyClass.new.my_method

#=> Success in the class definition!
#=> Success in the method!

# Sharing the scope
# shared is protected by scope gate
# so only :counter and :inc can see it. 
def define_methods
  shared = 0
  
  Kernel.send :define_method, :counter do
    shared
  end

  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end

define_methods
counter # => 0
inc(4)  # => 4
counter # => 4

# to twist scopes, you can use Scope Gates, Flat Scope, Shared Scopes.

# BasicObject#instance_eval
# it can access the receiver's private methods and instances

# BasicObject#instance_exec

# this break encapsulation  => Rspec example

# callable objects
# 1) proc
# 2) lambda
# 3) method

# blocks are not objects. What if I want to store it and pass it later to another object?
# a Proc is a block that has been turned into an object.

# (1) Kernel#proc and (2) Kernel#lambda to cenvert a block to a Proc
# (3) Proc.new {}
# (4) the & operator.
# (5) Method#to_proc

# convert block to method using define_method.

# Proc vs Lambda
# 1) return
# Proc returns from the scope it was defined, while lambda return as normal method
# 2) arguments
# Lambda is less tolerant than proc

#  Stubby lambda   ->(x) { x+1 }
