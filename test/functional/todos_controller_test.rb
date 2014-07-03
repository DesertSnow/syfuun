require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test '#index should render list of todos' do
    get :index
    assert_response :success
    assert_template :index

    todo_titles = assigns(:todos).map(&:title)

    assert_equal(['Make sure TDD is used', 'Make sure to work outside in'], todo_titles)
  end

  test '#index view should show all todos' do#for discussion
    get :index

    expected_list = ['Make sure TDD is used', 'Make sure to work outside in']
    assert_select('ul li') do |elements|
      assert_equal(expected_list.length, elements.length)
      (0...expected_list.length).each do |index|
        assert_include(elements[index].to_s, expected_list[index])
      end
    end
  end

  test '#new the new template' do
    get :new
    assert_template :new
    assert_instance_of Todo, assigns(:todo)
  end

  test '#new renders the form for a new todo' do
    get :new

    assert_select 'form' do
      assert_select 'input[type="text"]#todo_title'
      assert_select 'input[type="submit"]'
    end
  end
end
