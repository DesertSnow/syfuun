require 'test_helper'

class TodosListTest < ActionDispatch::IntegrationTest
  test 'root route should return list' do
    get '/'
    assert_response :success
    assert assigns(:todos)
  end

  test '"todos/" should return list' do
    get 'todos/'
    assert_response :success
    assert assigns(:todos)
  end
end
