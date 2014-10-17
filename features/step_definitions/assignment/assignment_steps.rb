Given /^I have a person "(.*?)"$/ do |name|
  Person.create(name:name)
end


When /^I assign the todo item "(.*?)" to person "(.*?)"$/ do |todo, person|
  click_link("Assign")
  check(person)
  click_button("Save")
end

Then /^"(.*?)" is assignee of the todo "(.*?)"$/ do |person, todo|
  expected_assignee = person
  actual_assignee =
  assert_equal(expected_assignee, actual_assignee)

end
