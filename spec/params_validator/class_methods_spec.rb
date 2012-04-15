require 'spec_helper'

class TestActionController < ActionController::Base
  include ::ParamsValidator::ClassMethods
  validate_params_for :index, { :q => { :required => true } }
end

describe ParamsValidator::ClassMethods do
  describe 'class_attribute' do
    it 'should define class_attribute on the controller' do
      TestActionController.should respond_to(:params_validation_definitions)
    end
  end

  describe 'class_method' do
    it 'should respond to check_params_for' do
      TestActionController.should respond_to(:validate_params_for)
    end
  end

  describe 'dynamic filter methods' do
    it 'should have check_params_for_action_index defined' do
      TestActionController.new.should respond_to(:validate_params_for_action_index)
    end
  end

  describe 'before filters' do
    subject { TestActionController._process_action_callbacks.select { |f| f.filter == :validate_params_for_action_index }.first }

    it 'should not be nil' do
      subject.should_not be_nil
    end

    it 'should be a before filter' do
      subject.kind.should == :before
    end

    it 'should be only for the defined method' do
      subject.options[:only].should == :index
    end
  end

  describe 'check_params_for' do
    subject { TestActionController.params_validation_definitions }

    it 'should have the action' do
      subject.keys.should include(:index)
    end

    it 'should have the definition' do
      subject[:index].should == { :q => { :required => true } }
    end
  end
end

