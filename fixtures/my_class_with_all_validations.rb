require './my_validator'

class MyClassWithAllValidations
  include MyValidator

  attr_accessor :parameter

  class_validate :parameter, format: /\A\d*\z/, presence: true, type: String
end
