require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  fixtures :todos

  test '#title is an attribute' do
    todo = Todo.new
    assert_nil todo.title
    todo.title = 'some random todo item'
    assert_equal(todo.title, 'some random todo item')
  end

  test 'does not save todo without title' do
    todo = Todo.new title: ''
    assert !todo.save
  end

  test '#finish! changes finished state to true and saves' do
    todo = todos(:unfinished)
    assert !todo.finished?

    todo.finish!

    assert todo.finished?#state changed?
    assert !todo.changed?#changes persisted?
  end

  test 'scope "unfinished" should not return finished todos' do
    results = Todo.unfinished
    assert_not_include results, todos(:finished)
  end

  test '#prioritise! updates prior to true' do
    todo = todos(:not_prioritised)
    todo.prioritise!
    assert todo.prior?
    assert !todo.changed?#changes persisted?
  end

  test 'scope "ordered_by_title"' do
    ordered_todos = [
        todos(:not_prioritised),
        todos(:finished),
        todos(:unfinished),
        todos(:prioritised)
    ].map(&:title)
    resulting_todos = Todo.ordered_by_title.map(&:title)
    assert_equal(ordered_todos, resulting_todos)
  end
end
