require './my_validator'

class MyFormatTestingClass
  include MyValidator

  attr_accessor :parameter

  class_validate :parameter, format: /\d*/
end
