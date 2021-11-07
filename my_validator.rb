module MyValidator
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def initialize(params = {})

    end

    def class_validate(attribute_name, validations_hash = { })
      @validated_attributes ||= { }
      @validated_attributes[attribute_name] ||= { }

      validations_hash.each do |validation_name, validation_comparison_value|
        @validated_attributes[attribute_name][validation_name] ||= validation_comparison_value
      end
    end

    def validated_attributes
      @validated_attributes
    end

    def attr_accessor(*vars)
      @attributes ||= []
      @attributes.concat vars
      super(*vars)
    end

    def attributes
      @attributes
    end
  end


  def validated_attributes
    self.class.validated_attributes
  end

  def attributes
    self.class.attributes
  end

  def class_valid?
    @valid = true

    validated_attributes.keys.each do |parameter|
      tested_value = send(parameter)
      full_validation_info = validated_attributes[parameter]
      perform_validation(parameter, full_validation_info.keys[0], full_validation_info.values[0], tested_value)
    end

    @valid
  end

  def class_validate!
    validated_attributes.keys.each do |parameter|
      tested_value = send(parameter)
      full_validation_info = validated_attributes[parameter]
      class_exception_validate!(parameter, full_validation_info.keys[0], full_validation_info.values[0], tested_value)
    end
  end

  def perform_validation(parameter, validation_key, validation_value, tested_value)
    case validation_key
    when :presence
      @valid = @valid && !send(parameter).nil?
    when :format
      @valid = @valid && !send(parameter) != nil && send(parameter) =~ validated_attributes[parameter][:format] # todo: test for cases when it is not a string but say an integer
    when :type
      @valid = @valid && !send(parameter) != nil && send(parameter).class == validated_attributes[parameter][:format]
    else
      @valid
    end
  end

  def class_exception_validate!(parameter, validation_key, validation_value, tested_value)
    case validation_key
    when :presence
      raise 'not nil' unless !send(parameter).nil?
    when :format
      raise 'invalid format' unless !send(parameter) != nil && send(parameter) =~ validated_attributes[parameter][:format] # todo: test for cases when it is not a string but say an integer
    when :type
      raise 'invalid type' unless !send(parameter) != nil && send(parameter).class == validated_attributes[parameter][:format]
    else
      @valid
    end
  end
end
