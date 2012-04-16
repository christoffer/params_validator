module ParamsValidator
  module Validator
    module Presence
      def self.error_message; "is empty"; end

      def self.valid?(value)
        value.present?
      end
    end
  end
end

