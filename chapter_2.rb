# static type check is
# for each method call, the compiler checks if the receiver has a matching method

# Dynamic Dispatch
# send a string || symbol to be executed on receiver

# Dynamic method
class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end

# method_missing  &  respond_to?

# OpenStruct

# Dynamic Procies