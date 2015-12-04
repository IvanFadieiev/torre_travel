require 'test_helper'

class TorreTravelsControllerTest < ActionController::TestCase
  setup do
    @torre_travel = torre_travels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:torre_travels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create torre_travel" do
    assert_difference('TorreTravel.count') do
      post :create, torre_travel: { description: @torre_travel.description, distance: @torre_travel.distance, housing: @torre_travel.housing, lang: @torre_travel.lang, price: @torre_travel.price }
    end

    assert_redirected_to torre_travel_path(assigns(:torre_travel))
  end

  test "should show torre_travel" do
    get :show, id: @torre_travel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @torre_travel
    assert_response :success
  end

  test "should update torre_travel" do
    patch :update, id: @torre_travel, torre_travel: { description: @torre_travel.description, distance: @torre_travel.distance, housing: @torre_travel.housing, lang: @torre_travel.lang, price: @torre_travel.price }
    assert_redirected_to torre_travel_path(assigns(:torre_travel))
  end

  test "should destroy torre_travel" do
    assert_difference('TorreTravel.count', -1) do
      delete :destroy, id: @torre_travel
    end

    assert_redirected_to torre_travels_path
  end
end
