module ParamsValidator
  module Validator
    module TypeInteger
      def self.valid?(value)
        begin
          Integer(value)
          true
        rescue
          false
        end
      end
    end
  end
end

