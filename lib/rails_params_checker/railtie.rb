module RailsParamsChecker
  class Railtie < Rails::Railtie
    initializer 'rails-params-checker.insert_into_action_controller' do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.send(:include, ::RailsParamsChecker::ClassMethods)
      end
    end
  end
end

