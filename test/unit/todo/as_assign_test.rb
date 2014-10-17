require 'test_helper'

class Todo::AsAssignTest < ActiveSupport::TestCase
  test '#new initiates a todo as assign model' do
    todo_as_assign = Todo::AsAssign.new()
    assert_instance_of Todo::AsAssign, todo_as_assign
  end

  # test '#person_id is an attribute' do
  #   name = 'Fons'
  #   person = Person.create(name: name)
  #   assert_equal(person.name, name)
  # end
end