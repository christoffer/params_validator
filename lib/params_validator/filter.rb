module ParamsValidator
  module Filter
    extend ActiveSupport::Inflector

    def self.validate_params(params, definition)
      definition.each do |field, validation_definition|
        validation_definition[:with].each do |validator_name|
          camelized_validator_name = self.camelize(validator_name)
          begin
            validator = constantize("ParamsValidator::Validator::#{camelized_validator_name}")
            unless validator.valid?(params[field.to_s])
              raise InvalidParamsException.new
            end
          rescue NameError
            raise InvalidValidatorException.new(validator_name)
          end
        end
      end
    end
  end
end

