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
# Gohst Methods. (slower)

# OpenStruct

# Dynamic Proxies

# Blank Slate
# a class that has fewer methods than Object class itself.

# Module#undef_method
# Module#remove_method

class Computer
  #undef methods except those starting with __, method missing and respond_to? 
  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|method_missing|respond_to?/
  end

end