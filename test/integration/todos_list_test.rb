require 'test_helper'

class TodosListTest < ActionDispatch::IntegrationTest
  fixtures :todos

  NEW_TODO_TITLE = 'Laundry'

  test 'index shows the list of unfinished todos' do
    todo_list_page.visit_me
    todo_list_page.contains_unfinished_todos
    todo_list_page.does_not_contain_finished_todos
  end

  test 'create a new todo which is shown on the index page' do
    todo_list_page.visit_me
    todo_list_page.add_new_todo(NEW_TODO_TITLE)
    todo_list_page.contains_todo(NEW_TODO_TITLE)
  end

  test 'mark todo as finished which makes it disappear from the index page' do
    unfinished_todo = todos(:unfinished)
    todo_list_page.visit_me
    todo_list_page.contains_todo(unfinished_todo.title)
    todo_list_page.finish_todo(unfinished_todo)
    todo_list_page.does_not_contain_todo(unfinished_todo.title)
  end

  test 'prioritise todo item ' do
  #  post_via_redirect "todos/#{todos(:not_prioritised).id}/prioritised"
  #  assert_response :success
  #  assert_equal '/todos', path
  end

  private
    module TodoListPage
      def visit_me
        visit('/todos')
        assert_status_code_success
      end

      def contains_unfinished_todos
        unfinished_todos.map(&:title).each do |title|
          contains_todo(title)
        end
      end

      def does_not_contain_finished_todos
        finished_todos.map(&:title).each do |title|
          does_not_contain_todo(title)
        end
      end

      def add_new_todo(title)
        # visit('/todos/new')
        click_link 'New'
        fill_in('Title', with: title)
        click_on('Create Todo')
        assert_status_code_success
      end

      def finish_todo(todo)
        # post "todos/#{todo.id}/finished"
        click_on('Finish')
        assert_status_code_success
        visit_me
      end

      def contains_todo(title)
        assert page.has_content?(title)
      end

      def does_not_contain_todo(title)
        assert !page.has_content?(title), "Expected page not to contain '#{title}'"
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