require 'test_helper'

class TodosListTest < ActionDispatch::IntegrationTest
  fixtures :todos

  test 'index should show the list of unfinished todos' do
    todo_list_page.visit_me
    todo_list_page.contains_unfinished_todos
    todo_list_page.does_not_contain_finished_todos
  end

  test 'create a new todo which is shown on the index page' do
    todo_list_page.visit_me
  #   todo_list_page.add_new_todo('laundry')
  #   todo_list_page.contains_todo('laundry')
  #   # post_via_redirect 'todos', todo: {title: 'do the laundry'}
  #   # assert_equal '/todos', path
  #   # assert_include response.body, 'do the laundry'
  end

  # test 'mark todo as finished which makes it disappear from the index page' do
  #   todo_list_page.visit_me
  #   todo_list_page.contains_todo(todos(:unfinished).title)
  #   todo_list_page.finish_todo(todos(:unfinished).title)
  #   todo_list_page.does_not_contain_todo(todos(:unfinished).title)
  #
  #   # get '/todos'
  #   # assert_include response.body, todos(:todo_1).title#to make sure it is finish action that removes item from list
  #   #
  #   # post_via_redirect "todos/#{todos(:todo_1).id}/finished"
  #   # assert_response :success
  #   # assert_equal '/todos', path
  #   #
  #   # #item no longer visible
  #   # assert_not_include response.body, todos(:todo_1).title
  # end
  #
  # test 'prioritise todo item' do
  #   post_via_redirect "todos/#{todos(:todo_1).id}/prioritised"
  #   assert_response :success
  #   assert_equal '/todos', path
  # end

  private
    module TodoListPage
      def visit_me
        visit '/todos'
        assert_status_code_success
      end

      def contains_unfinished_todos
        unfinished_todos.map(&:title).each do |title|
          assert page.has_content?(title)
        end
      end

      def does_not_contain_finished_todos
        finished_todos.map(&:title).each do |title|
          assert !page.has_content?(title)
        end
      end

      private
        def assert_status_code_success
          assert_equal(200, page.status_code)
        end

        def unfinished_todos
          [todos(:unfinished),todos(:not_prioritised),todos(:prioritised)]
        end

        def finished_todos
          [todos(:finished)]
        end
    end

    def todo_list_page
      @todo_list_page ||= open_session do |session|
        session.extend TodoListPage
      end
    end
end