require 'spec_helper'

module ParamsValidator
  module Validator
    describe ParamsValidator::Validator::TypeInteger do
      it 'should return true for Fixnum value' do
        TypeInteger.valid?(42).should be_true
      end

      it 'should return true for String value with integer content' do
        TypeInteger.valid?('42').should be_true
      end

      it 'should return false for String value with non integer content' do
        TypeInteger.valid?('true').should be_false
      end

      it 'should return false for String value with non float content' do
        TypeInteger.valid?('4.2').should be_false
      end

      it 'should return true for empty String value' do
        TypeInteger.valid?('').should be_true
      end

      it 'should return true for nil value' do
        TypeInteger.valid?(nil).should be_true
      end
    end

    describe TypeFloat do
      it 'should return true for Float value' do
        TypeFloat.valid?(4.2).should be_true
      end

      it 'should return true for String value with float content' do
        TypeFloat.valid?('4.2').should be_true
      end

      it 'should return false for String value with non float content' do
        TypeFloat.valid?('true').should be_false
      end

      it 'should return true for empty String value' do
        TypeFloat.valid?('').should be_true
      end

      it 'should return true for nil value' do
        TypeFloat.valid?(nil).should be_true
      end
    end

    describe TypeString do
      it 'should return true for Array value' do
        TypeString.valid?('a string').should be_true
      end

      it 'should return false for non String value' do
        TypeString.valid?(42).should be_false
      end

      it 'should return true for nil value' do
        TypeString.valid?(nil).should be_true
      end
    end

    describe TypeArray do
      it 'should return true for Array value' do
        TypeArray.valid?([]).should be_true
      end

      it 'should return false for non Array value' do
        TypeArray.valid?('a string').should be_false
      end

      it 'should return true for empty String value' do
        TypeArray.valid?('').should be_true
      end

      it 'should return true for nil value' do
        TypeArray.valid?(nil).should be_true
      end
    end

    describe TypeHash do
      it 'should return true for Hash value' do
        TypeHash.valid?({}).should be_true
      end

      it 'should return false for non Hash value' do
        TypeHash.valid?('a string').should be_false
      end

      it 'should return true for empty String value' do
        TypeHash.valid?('').should be_true
      end

      it 'should return true for nil value' do
        TypeHash.valid?(nil).should be_true
      end
    end
  end
end

