#public
def greet
  'hello'
end

class A; end

#puts A.new.greet

puts A.class_eval {greet}

puts A.new.instance_eval {greet}

puts A.class_eval {self}
puts A.instance_eval {self}
puts A.new.instance_eval {
  def to_s
    'main_2'
  end
  
  self
}
