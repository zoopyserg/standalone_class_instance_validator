require './lib/standalone_class_instance_validator'

class MyTypeTestingClass
  include StandaloneClassInstanceValidator

  attr_accessor :parameter

  class_validate :parameter, type: Integer
end
