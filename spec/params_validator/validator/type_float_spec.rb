require 'spec_helper'

describe ParamsValidator::Validator::TypeFloat do
  it 'should return true for Float value' do
    ParamsValidator::Validator::TypeFloat.valid?(4.2).should be_true
  end

  it 'should return true for String value with float content' do
    ParamsValidator::Validator::TypeFloat.valid?('4.2').should be_true
  end

  it 'should return false for String value with non float content' do
    ParamsValidator::Validator::TypeFloat.valid?('true').should be_false
  end
end

