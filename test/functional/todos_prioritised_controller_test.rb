require 'test_helper'

class TodosPrioritisedControllerTest < ActionController::TestCase
  test '#create prioritises the todo item' do
    post :create, todo_id: todos(:not_prioritised).id
    assert_redirected_to '/todos'
    assert_equal true, assigns(:todo).prior
  end
end
