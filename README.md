# Standalone Class Instance Validator

An independent library that can validate attributes of any class, without a need to require external libraries.

# Installation

````ruby
# in Gemfile

gem 'standalone_class_instance_validator'
````

# Demo

Here is an example of code:
````
class MyClass
  include StandaloneClassInstanceValidator

  attr_accessor :parameter1, :parameter2

  class_validate :parameter1, format: /\A\d*\z/, presence: true, type: String
  class_validate :parameter2, presence: true, type: Integer
end

````

And here is how it behaves:
````ruby
item1 = MyClass.new
item1.parameter1 = nil
item1.parameter2 = 123
item1.class_valid? # => false
item1.class_validate! # => raises error "invalid format,attribute can not be nil,invalid type"

item2 = MyClass.new
item2.parameter1 = 'invalid string'
item2.parameter2 = 123
item2.class_valid? # => false
item2.class_validate! # => raises error "invalid format"

item3 = MyClass.new
item3.parameter1 = '123456789'
item3.parameter2 = 123
item3.class_valid? # => true
item3.class_validate! # => no error

item4 = MyClass.new
item4.parameter1 = 123
item4.parameter2 = 123
item4.class_valid? # => false
item4.class_validate! # => raises "invalid format,invalid type"

item5 = MyClass.new
item5.parameter1 = '123456789'
item5.parameter2 = nil
item5.class_valid? # => false
item5.class_validate! # => raises "attribute can not be nil,invalid type"
````

See more demos in spec folder.
