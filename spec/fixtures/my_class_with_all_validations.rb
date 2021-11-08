require './lib/standalone_class_instance_validator'

class MyClassWithAllValidations
  include StandaloneClassInstanceValidator

  attr_accessor :parameter

  class_validate :parameter, format: /\A\d*\z/, presence: true, type: String
end
