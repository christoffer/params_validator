require 'bundler/setup'
Bundler.require(:default)

module RailsParamsChecker
  class InvalidParamsException < Exception; end
end

require 'rails_params_checker/class_methods'
require 'rails_params_checker/filter'
require 'rails_params_checker/railtie'

