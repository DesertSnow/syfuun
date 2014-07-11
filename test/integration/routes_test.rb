require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'root routes to all the todos' do
    assert_routing '/', {controller: 'todos', action: 'index'}
  end

  test 'routes to new todo' do
    assert_routing '/todos/new', {controller: 'todos', action: 'new'}
  end
end