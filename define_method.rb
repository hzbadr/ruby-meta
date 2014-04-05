## define a method for object

# class A
# end

# a = A.new
# b = A.new

# a.define_singleton_method(:greet) do
#   puts "Hello"
# end

# a.greet
# begin
#   b.greet
# rescue Exception => e
#   puts e
# end

# A.define_singleton_method(:greet) do
#   puts "Hello '#{self.name}'"
# end

# A.greet

# begin
#   b.greet
# rescue Exception => e
#   puts e
# end

# Hello
# undefined method `greet' for #<A:0x00000001f2f200>
# Hello 'A'
# undefined method `greet' for #<A:0x00000001f2f200>

# =================================================================================================

## Another way for doing it.

# class A
# end

# a = A.new
# b = A.new

# module Greeting
#   def greet
#     puts "Hello from module"
#   end
# end

# b.extend Greeting

# a.greet
# b.greet

# Hello
# Hello from module

# =================================================================================================

# # define an instance method from an object.

# class A
# end

# a = A.new
# b = A.new

# module Greeting
#   def greet
#     puts "Hello from module"
#   end
# end

# # include is a private method, to call it we use (send)
# a.class.send :include, Greeting

# b.greet
# a.greet

# =================================================================================================

## Another way for doing it.

# class A
# end

# a = A.new
# b = A.new

# a.class.class_eval do
#   define_method :greet do
#     puts "Hello World"
#   end
# end

# a.greet
# b.greet

# =================================================================================================

