module ParamsValidator
  module Validator
    module Presence
      def self.valid?(value)
        value.present?
      end
    end
  end
end

