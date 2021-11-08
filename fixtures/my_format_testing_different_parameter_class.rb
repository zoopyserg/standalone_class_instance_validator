require './my_validator'

class MyFormatTestingDifferentParameterClass
  include MyValidator

  attr_accessor :other_parameter

  class_validate :other_parameter, format: /\A\d*\z/
end
