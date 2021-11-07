require './my_validator'

class MyClass
  include MyValidator

  attr_accessor :parameter
end
