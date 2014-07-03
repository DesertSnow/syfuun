require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test '#title is an attribute' do
    #for the sake of having a unit test as demonstration
    todo = Todo.new
    assert_nil todo.title
    todo.title = 'some random todo item'
    assert_equal(todo.title, 'some random todo item')
  end

  test 'does not save todo without title' do
    todo = Todo.new title: ''
    assert !todo.save
  end
end
