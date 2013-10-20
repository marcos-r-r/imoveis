require 'test_helper'

class VagaAssociadasControllerTest < ActionController::TestCase
  setup do
    @vaga_associada = vaga_associadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vaga_associadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vaga_associada" do
    assert_difference('VagaAssociada.count') do
      post :create, vaga_associada: @vaga_associada.attributes
    end

    assert_redirected_to vaga_associada_path(assigns(:vaga_associada))
  end

  test "should show vaga_associada" do
    get :show, id: @vaga_associada.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vaga_associada.to_param
    assert_response :success
  end

  test "should update vaga_associada" do
    put :update, id: @vaga_associada.to_param, vaga_associada: @vaga_associada.attributes
    assert_redirected_to vaga_associada_path(assigns(:vaga_associada))
  end

  test "should destroy vaga_associada" do
    assert_difference('VagaAssociada.count', -1) do
      delete :destroy, id: @vaga_associada.to_param
    end

    assert_redirected_to vaga_associadas_path
  end
end
