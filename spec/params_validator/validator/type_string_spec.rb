require 'spec_helper'

describe ParamsValidator::Validator::TypeString do
  it 'should return true for Array value' do
    ParamsValidator::Validator::TypeString.valid?('a string').should be_true
  end

  it 'should return false for non String value' do
    ParamsValidator::Validator::TypeString.valid?(42).should be_false
  end
end

