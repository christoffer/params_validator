require 'spec_helper'

class TestActionController < ActionController::Base
  include ::ParamsValidator::ClassMethods
  validate_params_for :index, { :q => { :required => true } }
end

describe ParamsValidator::Filter do
  it 'should call Integer validator' do
    ParamsValidator::Validator::TypeInteger.should_receive(:valid?).with(42) { true }
    ParamsValidator::Filter.validate_params(
      { 'int' => 42 },
      { :int => { :with => [:type_integer] } }
    )
  end

  it 'should call Float validator' do
    ParamsValidator::Validator::TypeFloat.should_receive(:valid?).with(4.2) { true }
    ParamsValidator::Filter.validate_params(
      { 'float' => 4.2 },
      { :float => { :with => [:type_float] } }
    )
  end

  it 'should call String validator'

  it 'should call Hash validator'

  it 'should call Array validator'

  it 'should raise InvalidParamsException when validator returns false' do
    ParamsValidator::Validator::TypeInteger.stub(:valid?) { false }
    lambda do
      ParamsValidator::Filter.validate_params(
        { 'int' => 42 },
        { :int => { :with => [:type_integer] } }
      )
    end.should raise_error ParamsValidator::InvalidParamsException
  end

  it 'should raise InvalidValidatorException when invalid filter name is used'
end

