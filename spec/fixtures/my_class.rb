require './lib/standalone_class_instance_validator'

class MyClass
  include StandaloneClassInstanceValidator

  attr_accessor :parameter
end
