require 'test_helper'

class GroupinvsControllerTest < ActionController::TestCase
  setup do
    @groupinv = groupinvs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupinvs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupinv" do
    assert_difference('Groupinv.count') do
      post :create, groupinv: { esAdministrador: @groupinv.esAdministrador, montoIngreso: @groupinv.montoIngreso, montoMensual: @groupinv.montoMensual, nombre: @groupinv.nombre, personasMax: @groupinv.personasMax, personasMin: @groupinv.personasMin }
    end

    assert_redirected_to groupinv_path(assigns(:groupinv))
  end

  test "should show groupinv" do
    get :show, id: @groupinv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @groupinv
    assert_response :success
  end

  test "should update groupinv" do
    patch :update, id: @groupinv, groupinv: { esAdministrador: @groupinv.esAdministrador, montoIngreso: @groupinv.montoIngreso, montoMensual: @groupinv.montoMensual, nombre: @groupinv.nombre, personasMax: @groupinv.personasMax, personasMin: @groupinv.personasMin }
    assert_redirected_to groupinv_path(assigns(:groupinv))
  end

  test "should destroy groupinv" do
    assert_difference('Groupinv.count', -1) do
      delete :destroy, id: @groupinv
    end

    assert_redirected_to groupinvs_path
  end
end
