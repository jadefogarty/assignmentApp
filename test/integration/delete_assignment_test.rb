# frozen_string_literal: true

require 'test_helper'

class CreateAssignmentTest < ActionDispatch::IntegrationTest
  test 'delete testing assignment' do
    # create a variable and assign it the value of a fixture
    assignment = assignments(:testing_assignment)

    # checks there is 4 assignments
    get '/assignments'
    # puts(response.parsed_body)
    # checks response is correct (4 test entries)
    assignment_response = response.parsed_body
    # puts(assignment_response.length)
    assert_response :ok
    assert_equal 4, assignment_response.length

    delete "/assignments/#{assignment.id}"

    # checks the assignment was deleted
    get '/assignments'
    # puts(response.parsed_body)
    # checks response is correct (4 test entries)
    assignment_response = response.parsed_body
    # puts(assignment_response.length)
    assert_response :ok
    assert_equal 3, assignment_response.length
  end
end
