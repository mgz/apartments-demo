require 'test_helper'

class AgenciesServiceTest < ActiveSupport::TestCase
  test 'We can load data from external_service service' do
    parsed_data = ExternalService::AgenciesService.call
    assert_not_nil parsed_data
    assert parsed_data.any?
    assert_instance_of Agency, parsed_data.first
  end
end