Given /^I have a list of todos with the following options:$/ do |table|
  puts table.class
  table.rows.each do |params|
    Todo.create(title: params[0])
  end
end

Given /^I have a todo item "(.*?)"$/ do |title|
  Todo.create(title: title)
end

Then /^"(.*?)" should be sorted "(.*?)" as follows:$/ do |arg1, arg2, table|
  entries = page.find(:css, '.todo_items').all('li.todo_item > span')
  todo_titles = entries.map(&:text)
  expected_todo_titles = table.rows.map{|row| row[0]}

  assert_equal(expected_todo_titles, todo_titles)
end

Then /^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
with_scope(selector) do
    assert page_has_content(text)
  end
end

When /^I go to "([^\"]*)"$/ do |page_name|
  visit path_to(page_name)
end

When /^I prioritise the todo "(.*?)"$/ do |todo|
  entries = page.find(:css, '.todo_items').all('li.todo_item > span')


end
