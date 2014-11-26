require 'spec_helper'

class SomeController
  include Napoleon::Helpers::Controller::ParamsConventions
  def params; {}; end
end

module Api
  class AnotherController < SomeController
  end
end

module Some
  class CreateParameterSanitizer < Napoleon::ParameterSanitizer
  end
end

module Api
  module Another
    class CreateParameterSanitizer < Napoleon::ParameterSanitizer
    end
  end
end

describe Napoleon::Helpers::Controller::ParamsConventions do
  context 'when controller is in namespace' do
    Given(:controller) { Api::AnotherController.new }
    describe 'create_params returns proper sanitizer' do
      When(:sanitizer) { controller.create_params }
      Then { expect(sanitizer).to be_kind_of Api::Another::CreateParameterSanitizer }
    end
  end

  context 'when controller is not in namespace' do
    Given(:controller) { SomeController.new }
    describe 'create_params returns proper sanitizer' do
      When(:sanitizer) { controller.create_params }
      Then { expect(sanitizer).to be_kind_of Some::CreateParameterSanitizer }
    end
  end
end