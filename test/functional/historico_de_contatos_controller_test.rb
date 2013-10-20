require 'test_helper'

class HistoricoDeContatosControllerTest < ActionController::TestCase
  setup do
    @historico_de_contato = historico_de_contatos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historico_de_contatos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historico_de_contato" do
    assert_difference('HistoricoDeContato.count') do
      post :create, historico_de_contato: @historico_de_contato.attributes
    end

    assert_redirected_to historico_de_contato_path(assigns(:historico_de_contato))
  end

  test "should show historico_de_contato" do
    get :show, id: @historico_de_contato.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historico_de_contato.to_param
    assert_response :success
  end

  test "should update historico_de_contato" do
    put :update, id: @historico_de_contato.to_param, historico_de_contato: @historico_de_contato.attributes
    assert_redirected_to historico_de_contato_path(assigns(:historico_de_contato))
  end

  test "should destroy historico_de_contato" do
    assert_difference('HistoricoDeContato.count', -1) do
      delete :destroy, id: @historico_de_contato.to_param
    end

    assert_redirected_to historico_de_contatos_path
  end
end
