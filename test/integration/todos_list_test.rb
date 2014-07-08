require 'test_helper'

class TodosListTest < ActionDispatch::IntegrationTest
  fixtures :todos

  #TODO extract route tests in separate class
  #TODO use assert_routing

  test 'default route should return todo list' do
    get '/'
    assert_response :success
    assert_not_nil assigns(:todos)
  end

  test 'index should show the list of unfinished todos' do
    todo_list_page.visit
    todo_list_page.contains_unfinished_todos
    todo_list_page.does_not_contain_finished_todos
  end

  # test 'new todo' do
  #   get 'todos/new'
  #   assert_response :success
  #   assert_not_nil assigns(:todo)
  # end

  test 'create a new todo which is shown on the index page' do
    todo_list_page.visit
    todo_list_page.add_new_todo('laundry')
    todo_list_page.contains_todo('laundry')
    # post_via_redirect 'todos', todo: {title: 'do the laundry'}
    # assert_equal '/todos', path
    # assert_include response.body, 'do the laundry'
  end

  test 'mark todo as finished which makes it disappear from the index page' do
    todo_list_page.visit
    todo_list_page.contains_todo(todos(:unfinished).title)
    todo_list_page.finish_todo(todos(:unfinished).title)
    todo_list_page.does_not_contain_todo(todos(:unfinished).title)

    # get '/todos'
    # assert_include response.body, todos(:todo_1).title#to make sure it is finish action that removes item from list
    #
    # post_via_redirect "todos/#{todos(:todo_1).id}/finished"
    # assert_response :success
    # assert_equal '/todos', path
    #
    # #item no longer visible
    # assert_not_include response.body, todos(:todo_1).title
  end

  test 'prioritise todo item' do
    post_via_redirect "todos/#{todos(:todo_1).id}/prioritised"
    assert_response :success
    assert_equal '/todos', path
  end

  private

    def todo_list_page
      @todo_list_page ||= TodoListPage.new
    end
end


class TodoListPage
  def visit
    get '/todos'
    assert_response :success
  end

  def contains_unfinished_todos
    #check if unfinished todo titles are in response
  end

  def does_not_contain_finished_todos
    #check if finished todo titles are not in response
  end
end