require './lib/standalone_class_instance_validator'

class MyFormatTestingDifferentParameterClass
  include StandaloneClassInstanceValidator

  attr_accessor :other_parameter

  class_validate :other_parameter, format: /\A\d*\z/
end
