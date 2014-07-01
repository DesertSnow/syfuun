require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test '#index should render list of todos' do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:todos)
  end
end
