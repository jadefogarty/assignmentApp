# frozen_string_literal: true

require 'test_helper'

class CreateAssignmentTest < ActionDispatch::IntegrationTest
  test 'view details of all assignments' do
    # send a get request to get all assignments
    get '/assignments'

    assert_response :ok
  end

  test 'view details of an assignment' do
    # create a variable and assign it the value of a fixture
    assignment = assignments(:coding_assignment)

    # send a get request to get assignment details
    get "/assignments/#{assignment.id}"
    assert_response :ok
  end
end
