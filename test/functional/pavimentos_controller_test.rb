require 'test_helper'

class PavimentosControllerTest < ActionController::TestCase
  setup do
    @pavimento = pavimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pavimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pavimento" do
    assert_difference('Pavimento.count') do
      post :create, pavimento: @pavimento.attributes
    end

    assert_redirected_to pavimento_path(assigns(:pavimento))
  end

  test "should show pavimento" do
    get :show, id: @pavimento.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pavimento.to_param
    assert_response :success
  end

  test "should update pavimento" do
    put :update, id: @pavimento.to_param, pavimento: @pavimento.attributes
    assert_redirected_to pavimento_path(assigns(:pavimento))
  end

  test "should destroy pavimento" do
    assert_difference('Pavimento.count', -1) do
      delete :destroy, id: @pavimento.to_param
    end

    assert_redirected_to pavimentos_path
  end
end
