require 'test_helper'

class TodoFinishedControllerTest < ActionController::TestCase
  test 'create should flag todo as finished' do
    used_todo = todos(:todo_1)
    assert !used_todo.finished?
    post :create, id: todos(:todo_1).id
    used_todo.reload#next assert failed while code seemed ok
    assert used_todo.finished?
  end

  test 'create should redirect to the list' do#was fixed first
    used_todo = todos(:todo_1)
    post :create, id: todos(:todo_1).id
   assert_redirected_to '/todos'
  end
end
