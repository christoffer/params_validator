module ParamsValidator
  class Railtie < Rails::Railtie
    initializer 'params_validator.insert_into_action_controller' do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.send(:include, ::ParamsValidator::ClassMethods)
      end
    end
  end
end

