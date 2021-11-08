require './my_validator'

class MyClassWithMultipleParameters
  include MyValidator

  attr_accessor :parameter1, :parameter2

  class_validate :parameter1, format: /\A\d*\z/, presence: true, type: String
  class_validate :parameter2, presence: true, type: Integer
end
