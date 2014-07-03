require 'test_helper'

class TodosListTest < ActionDispatch::IntegrationTest
  test 'root route should return list' do
    get '/'
    assert_response :success
    assert_not_nil assigns(:todos)
  end

  test '"todos/" should return list' do
    get 'todos/'
    assert_response :success
    assert_not_nil assigns(:todos)
  end

  test 'new todo' do
    get 'todos/new'
    assert_response :success
    assert_not_nil assigns(:todo)
  end

  test 'create todo' do
    post_via_redirect 'todos', title: 'do the laundry'
    assert_equal '/todos', path
    assert_include response.body, 'do the laundry'
  end
end
