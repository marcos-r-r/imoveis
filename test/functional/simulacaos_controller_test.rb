require 'test_helper'

class SimulacaosControllerTest < ActionController::TestCase
  setup do
    @simulacao = simulacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simulacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simulacao" do
    assert_difference('Simulacao.count') do
      post :create, simulacao: @simulacao.attributes
    end

    assert_redirected_to simulacao_path(assigns(:simulacao))
  end

  test "should show simulacao" do
    get :show, id: @simulacao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simulacao.to_param
    assert_response :success
  end

  test "should update simulacao" do
    put :update, id: @simulacao.to_param, simulacao: @simulacao.attributes
    assert_redirected_to simulacao_path(assigns(:simulacao))
  end

  test "should destroy simulacao" do
    assert_difference('Simulacao.count', -1) do
      delete :destroy, id: @simulacao.to_param
    end

    assert_redirected_to simulacaos_path
  end
end
