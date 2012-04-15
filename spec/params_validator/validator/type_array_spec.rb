require 'spec_helper'

describe ParamsValidator::Validator::TypeArray do
  it 'should return true for Array value' do
    ParamsValidator::Validator::TypeArray.valid?([]).should be_true
  end

  it 'should return false for non Array value' do
    ParamsValidator::Validator::TypeArray.valid?('a string').should be_false
  end
end

