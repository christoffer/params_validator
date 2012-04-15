module ParamsValidator
  module Validator
    module TypeArray
      def self.valid?(value)
        value.kind_of? Array
      end
    end
  end
end

