require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:bartek)
    @update = {
      firstname: 'Aas',
      lastname: 'Zxc',
      nip: 1233210131,
      address: addresses(:poznan)
    }
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

  test 'should create client' do
    assert_difference('Client.count') do
      post :create, client: @update
    end
    assert_redirected_to clients_path
  end

  test "should update client" do
    patch :update, id: @client, client: @update
    assert_redirected_to client_path(assigns(:client))
  end

  test "should get destroy" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client.id
    end
    assert_redirected_to clients_path
  end

end
