require './lib/standalone_class_instance_validator'

class MyPresenceTestingClass
  include StandaloneClassInstanceValidator

  attr_accessor :parameter

  class_validate :parameter, presence: true
end
