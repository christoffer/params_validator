module ParamsValidator
  module Validator
    module TypeFloat
      def self.valid?(value)
        begin
          Float(value)
          true
        rescue
          false
        end
      end
    end
  end
end

