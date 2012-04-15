module ParamsValidator
  module Validator
    module TypeString
      def self.valid?(value)
        value.kind_of? String
      end
    end
  end
end

