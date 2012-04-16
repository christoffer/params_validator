require 'spec_helper'

class TestActionController < ActionController::Base
  include ::ParamsValidator::ClassMethods
  validate_params_for :index, { :q => { :required => true } }
end

describe ParamsValidator::Filter do
  it 'should call Integer validator' do
    ParamsValidator::Validator::TypeInteger.should_receive(:valid?).with(42) { true }
    ParamsValidator::Filter.validate_params(
      { 'field_name' => 42 },
      { :field_name => { :with => [:type_integer] } }
    )
  end

  it 'should call Float validator' do
    ParamsValidator::Validator::TypeFloat.should_receive(:valid?).with(4.2) { true }
    ParamsValidator::Filter.validate_params(
      { 'field_name' => 4.2 },
      { :field_name => { :with => [:type_float] } }
    )
  end

  it 'should call String validator' do
    ParamsValidator::Validator::TypeString.should_receive(:valid?).with('a string') { true }
    ParamsValidator::Filter.validate_params(
      { 'field_name' => 'a string' },
      { :field_name => { :with => [:type_string] } }
    )
  end

  it 'should call Hash validator' do
    ParamsValidator::Validator::TypeHash.should_receive(:valid?).with({}) { true }
    ParamsValidator::Filter.validate_params(
      { 'field_name' => {} },
      { :field_name => { :with => [:type_hash] } }
    )
  end

  it 'should call Array validator' do
    ParamsValidator::Validator::TypeArray.should_receive(:valid?).with([]) { true }
    ParamsValidator::Filter.validate_params(
      { 'field_name' => [] },
      { :field_name => { :with => [:type_array] } }
    )
  end

  it 'should call Presence validator' do
    ParamsValidator::Validator::Presence.should_receive(:valid?).with('a string') { true }
    ParamsValidator::Filter.validate_params(
      { 'field_name' => 'a string' },
      { :field_name => { :with => [:presence] } }
    )
  end

  it 'should raise InvalidParamsException when validator returns false' do
    ParamsValidator::Validator::TypeInteger.stub(:valid?) { false }
    lambda do
      ParamsValidator::Filter.validate_params(
        { 'field_name' => 42 },
        { :field_name => { :with => [:type_integer] } }
      )
    end.should raise_error ParamsValidator::InvalidParamsException
  end

  it 'should raise InvalidValidatorException when invalid filter name is used' do
    lambda do
      ParamsValidator::Filter.validate_params(
        { 'field_name' => 42 },
        { :field_name => { :with => [:type_invalid] } }
      )
    end.should raise_error ParamsValidator::InvalidValidatorException
  end
end

