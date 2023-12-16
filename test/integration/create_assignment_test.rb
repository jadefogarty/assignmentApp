# frozen_string_literal: true

require 'test_helper'

class CreateAssignmentTest < ActionDispatch::IntegrationTest
  test 'create an assignment that is submitted' do
    # send a post request to the api to create a new assignment
    post '/assignments', params: { assignment: { name: 'Create use cases',
                                                 description: 'Create use cases for project report',
                                                 module: 'Programming',
                                                 lecturer: 'John Doe',
                                                 due_date: '2023-12-22 13:40:24',
                                                 weighting: 50.0,
                                                 status: 'Started',
                                                 submitted: true } }
    # checks response to see if assignment was created
    assert_response :created

    # send a get request to get all assignments
    get '/assignments'
    # puts(response.parsed_body)
    # checks response is correct (4 test entries + 1 created in this test)
    assignment_response = response.parsed_body
    assert_response :ok
    assert_equal 5, assignment_response.length

    # check the submitted parameter for the assignment created in this test
    assert_equal true, assignment_response[4]['submitted']
  end


  test 'create an assignment that is not submitted' do
    # send a post request to the api to create a new assignment
    post '/assignments', params: { assignment: { name: 'Technical Report',
                                                 description: 'Complete technical report',
                                                 module: 'Computing Project',
                                                 lecturer: 'Jane Doe',
                                                 due_date: '2024-01-06 12:53:24',
                                                 weighting: 70.0,
                                                 status: 'Not Started',
                                                 submitted: false } }
    # checks response to see if assignment was created
    assert_response :created

    # send a get request to get all assignments
    get '/assignments'
    # puts(response.parsed_body)
    # checks response is correct (4 test entries + 1 created in this test)
    assignment_response = response.parsed_body
    assert_response :ok
    assert_equal 5, assignment_response.length

    # check the submitted parameter for the assignment created in this test
    assert_equal false, assignment_response[4]['submitted']
  end


  test 'create an assignment that is named accordingly' do
    # send a post request to the api to create a new assignment
    post '/assignments', params: { assignment: { name: 'Requirements Specification',
                                                 description: 'Work on requirements specification',
                                                 module: 'Team Project',
                                                 lecturer: 'Jane Doe',
                                                 due_date: '2024-02-17 22:13:55',
                                                 weighting: 40.0,
                                                 status: 'Not Started',
                                                 submitted: false } }
    # checks response to see if assignment was created
    assert_response :created

    # send a get request to get all assignments
    get '/assignments'
    # puts(response.parsed_body)
    # checks response is correct (4 test entries + 1 created in this test)
    assignment_response = response.parsed_body
    assert_response :ok
    assert_equal 5, assignment_response.length

    # check the submitted parameter for the assignment created in this test
    assert_equal 'Requirements Specification', assignment_response[4]['name']
  end
end
