require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test '#create creates a person' do
    person = Person.create()
    assert_equal(person.class, Person)
  end

  test '#name is an attribute' do
    name = 'Fons'
    person = Person.create(name: name)
    assert_equal(person.name, name)
  end
end