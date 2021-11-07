require './my_validator'

class MyClass
  include MyValidator

  attr_accessor :presence_tested_field, :format_tested_field, :type_tested_field


  class_validate :presence_tested_field, presence: true
  class_validate :format_tested_field, format: /\d*/
  class_validate :type_tested_field, type: Integer
end
