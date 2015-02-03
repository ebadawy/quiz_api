require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  setup do
    @quiz = quizzes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quizzes)
  end

  test "should create quiz" do
    assert_difference('Quiz.count') do
      post :create, quiz: { name: @quiz.name }
    end

    assert_response 201
  end

  test "should show quiz" do
    get :show, id: @quiz
    assert_response :success
  end

  test "should update quiz" do
    put :update, id: @quiz, quiz: { name: @quiz.name }
    assert_response 204
  end

  test "should destroy quiz" do
    assert_difference('Quiz.count', -1) do
      delete :destroy, id: @quiz
    end

    assert_response 204
  end
end
