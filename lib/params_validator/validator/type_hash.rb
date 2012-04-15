module ParamsValidator
  module Validator
    module TypeHash
      def self.valid?(value)
        value.kind_of? Hash
      end
    end
  end
end

