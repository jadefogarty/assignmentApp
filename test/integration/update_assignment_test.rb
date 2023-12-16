# frozen_string_literal: true

require 'test_helper'

class UpdateAssignmentTest < ActionDispatch::IntegrationTest
  test 'edit coding assignment' do
    # create a variable and assign it the value of a fixture
    assignment = assignments(:coding_assignment)
    puts(assignment.id)
    # patch request to update the description from "java" to "python"
    patch "/assignments/#{assignment.id}", params: { assignment: { name: 'Coding Project',
                                                                   description: 'Create a python application',
                                                                   module: 'Programming',
                                                                   lecturer: 'Jane Doe',
                                                                   due_date: '2023-11-29 12:42:00',
                                                                   weighting: 100.0,
                                                                   status: 'Completed',
                                                                   submitted: true } }
    # checks response to see if assignment was updated
    assert_response :ok

    # send a get request to get all assignments
    get '/assignments'
    # puts(response.parsed_body)
    # checks response is correct (4 test entries)
    assignment_response = response.parsed_body
    assert_response :ok
    assert_equal 4, assignment_response.length

    # get the updated assignment details
    get "/assignments/#{assignment.id}"
    # puts(response.parsed_body)
    updated_assignment_response = response.parsed_body

    # check the submitted parameter for the assignment updated in this test
    assert_equal 'Create a python application', updated_assignment_response['description']
  end

  test 'edit testing assignment' do
    # create a variable and assign it the value of a fixture
    assignment = assignments(:testing_assignment)

    # patch request to update the submitted from "false" to "true" and the status from "started" to "completed"
    patch "/assignments/#{assignment.id}", params: { assignment: { name: 'Testing Application',
                                                                   description: 'Perform testing on web application',
                                                                   module: 'Software Testing',
                                                                   lecturer: 'John Doe',
                                                                   due_date: '2023-12-16 23:59:00',
                                                                   weighting: 60.0,
                                                                   status: 'Completed',
                                                                   submitted: true } }
    # checks response to see if assignment was updated
    assert_response :ok

    # send a get request to get all assignments
    get '/assignments'
    # puts(response.parsed_body)
    # checks response is correct (4 test entries)
    assignment_response = response.parsed_body
    assert_response :ok
    assert_equal 4, assignment_response.length

    # get the updated assignment details
    get "/assignments/#{assignment.id}"
    # puts(response.parsed_body)
    updated_assignment_response = response.parsed_body

    # check the submitted parameter for the assignment updated in this test
    assert_equal 'Completed', updated_assignment_response['status']
    assert_equal true, updated_assignment_response['submitted']
  end
end
