require 'test_helper'

class EmpreendimentosControllerTest < ActionController::TestCase
  setup do
    @empreendimento = empreendimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empreendimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empreendimento" do
    assert_difference('Empreendimento.count') do
      post :create, empreendimento: @empreendimento.attributes
    end

    assert_redirected_to empreendimento_path(assigns(:empreendimento))
  end

  test "should show empreendimento" do
    get :show, id: @empreendimento.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empreendimento.to_param
    assert_response :success
  end

  test "should update empreendimento" do
    put :update, id: @empreendimento.to_param, empreendimento: @empreendimento.attributes
    assert_redirected_to empreendimento_path(assigns(:empreendimento))
  end

  test "should destroy empreendimento" do
    assert_difference('Empreendimento.count', -1) do
      delete :destroy, id: @empreendimento.to_param
    end

    assert_redirected_to empreendimentos_path
  end
end
