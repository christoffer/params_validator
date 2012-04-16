module ParamsValidator
  module Validator
    module TypeInteger
      def self.error_message; "is not of type integer"; end

      def self.valid?(value)
        return true unless Presence.valid?(value)

        begin
          Integer(value)
          true
        rescue
          false
        end
      end
    end

    module TypeFloat
      def self.error_message; "is not of type float"; end

      def self.valid?(value)
        return true unless Presence.valid?(value)

        begin
          Float(value)
          true
        rescue
          false
        end
      end
    end

    module TypeString
      def self.error_message; "is not of type string"; end

      def self.valid?(value)
        return true unless Presence.valid?(value)

        value.kind_of? String
      end
    end

    module TypeArray
      def self.error_message; "is not of type array"; end

      def self.valid?(value)
        return true unless Presence.valid?(value)

        value.kind_of? Array
      end
    end

    module TypeHash
      def self.error_message; "is not of type hash"; end

      def self.valid?(value)
        return true unless Presence.valid?(value)

        value.kind_of? Hash
      end
    end
  end
end

