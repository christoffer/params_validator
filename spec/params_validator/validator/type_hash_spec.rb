require 'spec_helper'

describe ParamsValidator::Validator::TypeHash do
  it 'should return true for Hash value' do
    ParamsValidator::Validator::TypeHash.valid?({}).should be_true
  end

  it 'should return false for non Hash value' do
    ParamsValidator::Validator::TypeHash.valid?('a string').should be_false
  end
end

