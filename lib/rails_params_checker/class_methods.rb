module RailsParamsChecker
  module ClassMethods
    extend ActiveSupport::Concern

    included do
      class_attribute :params_check_definitions
    end

    module ClassMethods
      def check_params_for(action, definition)
        self.params_check_definitions ||= {}
        self.params_check_definitions[action.to_sym] = definition

        action_filter_name = "check_params_for_action_#{action}".to_sym

        define_method(action_filter_name) do
          Filter::check_params(params, definition)
        end
        self.before_filter action_filter_name, :only => action
      end
    end
  end
end

