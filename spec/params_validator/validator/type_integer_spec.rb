require 'spec_helper'

describe ParamsValidator::Validator::TypeInteger do
  it 'should return true for Fixnum value' do
    ParamsValidator::Validator::TypeInteger.valid?(42).should be_true
  end

  it 'should return true for String value with integer content' do
    ParamsValidator::Validator::TypeInteger.valid?('42').should be_true
  end

  it 'should return false for String value with non integer content' do
    ParamsValidator::Validator::TypeInteger.valid?('true').should be_false
  end

  it 'should return false for String value with non float content' do
    ParamsValidator::Validator::TypeInteger.valid?('4.2').should be_false
  end
end

