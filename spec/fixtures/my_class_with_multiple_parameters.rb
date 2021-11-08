require './lib/standalone_class_instance_validator'

class MyClassWithMultipleParameters
  include StandaloneClassInstanceValidator

  attr_accessor :parameter1, :parameter2

  class_validate :parameter1, format: /\A\d*\z/, presence: true, type: String
  class_validate :parameter2, presence: true, type: Integer
end
