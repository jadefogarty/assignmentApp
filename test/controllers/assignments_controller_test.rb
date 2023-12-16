# frozen_string_literal: true

require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment = assignments(:one)
  end

  test 'should get index' do
    get assignments_url, as: :json
    assert_response :success
  end

  test 'should create assignment' do
    assert_difference('Assignment.count') do
      post assignments_url,
           params: { assignment: { description: @assignment.description, due_date: @assignment.due_date, lecturer: @assignment.lecturer, module: @assignment.module, name: @assignment.name, status: @assignment.status, submitted: @assignment.submitted, weighting: @assignment.weighting } }, as: :json
    end

    assert_response :created
  end

  test 'should show assignment' do
    get assignment_url(@assignment), as: :json
    assert_response :success
  end

  test 'should update assignment' do
    patch assignment_url(@assignment),
          params: { assignment: { description: @assignment.description, due_date: @assignment.due_date, lecturer: @assignment.lecturer, module: @assignment.module, name: @assignment.name, status: @assignment.status, submitted: @assignment.submitted, weighting: @assignment.weighting } }, as: :json
    assert_response :success
  end

  test 'should destroy assignment' do
    assert_difference('Assignment.count', -1) do
      delete assignment_url(@assignment), as: :json
    end

    assert_response :no_content
  end
end
