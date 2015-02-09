require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  setup do
    @result = results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:results)
  end

  test "should create result" do
    assert_difference('Result.count') do
      post :create, result: {  }
    end

    assert_response 201
  end

  test "should show result" do
    get :show, id: @result
    assert_response :success
  end

  test "should update result" do
    put :update, id: @result, result: {  }
    assert_response 204
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete :destroy, id: @result
    end

    assert_response 204
  end
end
