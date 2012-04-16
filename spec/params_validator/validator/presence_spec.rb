require 'spec_helper'

module ParamsValidator
  module Validator
    describe Presence do
      it 'should return true for a non blank value' do
        Presence.valid?('a string').should be_true
      end

      it 'should return false for an empty string' do
        Presence.valid?('').should be_false
      end

      it 'should return false for nil' do
        Presence.valid?(nil).should be_false
      end
    end
  end
end

