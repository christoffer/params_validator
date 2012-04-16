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

    module TypeString
      def self.valid?(value)
        value.kind_of? String
      end
    end

    module TypeArray
      def self.valid?(value)
        value.kind_of? Array
      end
    end

    module TypeHash
      def self.valid?(value)
        value.kind_of? Hash
      end
    end
  end
end

