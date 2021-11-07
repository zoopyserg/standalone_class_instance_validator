require './my_validator'

class MyTypeTestingClass
  include MyValidator

  attr_accessor :parameter

  class_validate :parameter, type: Integer
end
