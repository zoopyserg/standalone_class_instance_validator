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
      @validated_attributes ||= { }
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
    validate_everything.empty?
  end

  def class_validate!
    errors = validate_everything
    raise errors.join(',') unless errors.empty?
  end

  private

  def validate_everything
    @errors = []
    validated_attributes.keys.each do |parameter|
      tested_value = send(parameter)
      full_validation_info = validated_attributes[parameter]
      full_validation_info.each do |key, value|
        class_exception_validate!(parameter, key, value, tested_value)
      end
    end
    @errors
  end

  def class_exception_validate!(parameter, validation_key, validation_value, tested_value)
    case validation_key
    when :presence
      @errors << 'attribute can not be nil' unless instance_parameter_value_present?(parameter)
    when :format
      @errors << 'invalid format' unless consider_format_valid?(parameter)
    when :type
      @errors << 'invalid type' unless consider_type_valid?(parameter)
    else
    end
  end

  def instance_parameter_value_present?(parameter)
    !send(parameter).nil?
  end

  def instance_parameter_matches_format(parameter)
    send(parameter).match?(validated_attributes[parameter][:format])
  end

  def instance_parameter_type_matches_type(parameter)
    send(parameter).kind_of?(validated_attributes[parameter][:type]) # todo: test for bad user input (e.g. if user enters smth else instead of a class)
  end

  def instance_parameter_is_a_string(parameter)
    send(parameter).kind_of?(String) # todo: test for bad user input (e.g. if user enters smth else instead of a class)
  end

  def consider_format_valid?(parameter)
    instance_parameter_value_present?(parameter) && instance_parameter_is_a_string(parameter) && instance_parameter_matches_format(parameter)
  end

  def consider_type_valid?(parameter)
    instance_parameter_value_present?(parameter) && instance_parameter_type_matches_type(parameter)
  end
end
