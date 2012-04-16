module ParamsValidator
  module Filter
    extend ActiveSupport::Inflector

    def self.validate_params(params, definition)
      errors = {}
      definition.each do |field, validation_definition|
        validation_definition[:with].each do |validator_name|
          camelized_validator_name = self.camelize(validator_name)
          begin
            validator = constantize("ParamsValidator::Validator::#{camelized_validator_name}")
            unless validator.valid?(params[field.to_s])
              errors[field] = validator.error_message
            end
          rescue NameError
            raise InvalidValidatorException.new(validator_name)
          end
        end
      end
      if errors.count > 0
        exception = InvalidParamsException.new
        exception.errors = errors
        raise exception
      end
    end
  end
end

