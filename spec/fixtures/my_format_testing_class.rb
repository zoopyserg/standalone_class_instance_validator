require './lib/standalone_class_instance_validator'

class MyFormatTestingClass
  include StandaloneClassInstanceValidator

  attr_accessor :parameter

  class_validate :parameter, format: /\A\d*\z/
end
