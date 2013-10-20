require 'test_helper'

class EspacosControllerTest < ActionController::TestCase
  setup do
    @espaco = espacos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:espacos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create espaco" do
    assert_difference('Espaco.count') do
      post :create, espaco: @espaco.attributes
    end

    assert_redirected_to espaco_path(assigns(:espaco))
  end

  test "should show espaco" do
    get :show, id: @espaco.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @espaco.to_param
    assert_response :success
  end

  test "should update espaco" do
    put :update, id: @espaco.to_param, espaco: @espaco.attributes
    assert_redirected_to espaco_path(assigns(:espaco))
  end

  test "should destroy espaco" do
    assert_difference('Espaco.count', -1) do
      delete :destroy, id: @espaco.to_param
    end

    assert_redirected_to espacos_path
  end
end
