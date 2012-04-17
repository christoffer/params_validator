module ParamsValidator
  module Validator

    private

    module Base
      private
      def define_type_validator(type_name, &block)
        @type_name = type_name
        @block = block

        def self.error_message
          "is not of type #{@type_name.to_s.downcase}"
        end

        def self.valid?(value)
          return true unless Presence.valid?(value)
          return !!@block.call(value) rescue false
        end
      end
    end

    public

    module TypeInteger
      extend Base
      define_type_validator('integer') { |value| Integer(value) }
    end

    module TypeFloat
      extend Base
      define_type_validator('float') { |value| Float(value) }
    end

    module TypeString
      extend Base
      define_type_validator('string') { |value| value.kind_of? String }
    end

    module TypeArray
      extend Base
      define_type_validator('array') { |value| value.kind_of? Array }
    end

    module TypeHash
      extend Base
      define_type_validator('hash') { |value| value.kind_of? Hash }
    end
  end
end

