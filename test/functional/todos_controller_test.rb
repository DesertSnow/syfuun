require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test '#index should render list of UNFINISHED todos' do
    get :index
    assert_response :success
    assert_template :index

    todo_titles = assigns(:todos).map(&:title)

    assert_equal(['Make sure TDD is used', 'Make sure to work outside in'], todo_titles)
  end

  test '#index view should show all UNFINISHED todos' do#for discussion
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

    #optional
    assert_select 'form' do
      assert_select 'input[type="text"]#todo_title'
      assert_select 'input[type="submit"]'
    end
  end

  test '#create with success' do
    assert_difference('Todo.count') do
      post :create, todo: {title: 'do the laundry'}
    end

    assert_redirected_to todos_path
  end

  test '#create with failure' do
    assert_no_difference('Todo.count') do
      post :create, todo: {title: ''}
    end
    assert_template :new
    assert_equal assigns(:todo).errors[:title], ["can't be blank"]

    #optional
    assert_select '#error_explanation ul' do |elements|
      elements.each do |element|
        assert_select element, 'li', "Title can't be blank"
      end
    end
  end
end
