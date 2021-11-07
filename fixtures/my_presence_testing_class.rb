require './my_validator'

class MyPresenceTestingClass
  include MyValidator

  attr_accessor :parameter

  class_validate :parameter, presence: true
end
