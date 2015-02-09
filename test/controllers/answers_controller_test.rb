require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer = answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answers)
  end

  test "should create answer" do
    assert_difference('Answer.count') do
      post :create, answer: { answer: @answer.answer, corrent: @answer.corrent }
    end

    assert_response 201
  end

  test "should show answer" do
    get :show, id: @answer
    assert_response :success
  end

  test "should update answer" do
    put :update, id: @answer, answer: { answer: @answer.answer, corrent: @answer.corrent }
    assert_response 204
  end

  test "should destroy answer" do
    assert_difference('Answer.count', -1) do
      delete :destroy, id: @answer
    end

    assert_response 204
  end
end
