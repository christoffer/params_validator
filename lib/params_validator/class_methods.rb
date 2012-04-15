module ParamsValidator
  module ClassMethods
    extend ActiveSupport::Concern

    included do
      class_attribute :params_validation_definitions
    end

    module ClassMethods
      def validate_params_for(action, definition)
        self.params_validation_definitions ||= {}
        self.params_validation_definitions[action.to_sym] = definition

        action_filter_name = "validate_params_for_action_#{action}".to_sym

        define_method(action_filter_name) do
          Filter::validate_params(params, definition)
        end
        self.before_filter action_filter_name, :only => action
      end
    end
  end
end

