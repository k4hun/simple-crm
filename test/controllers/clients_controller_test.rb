require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:bartek)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @client.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy, id: @client.id
    assert_redirected_to clients_path
  end

end
