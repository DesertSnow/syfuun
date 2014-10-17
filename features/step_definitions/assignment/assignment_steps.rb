Given /^I have a person "(.*?)"$/ do |name|
  Person.create(name:name)
end


When /^I assign the todo item "(.*?)" to person "(.*?)"$/ do |todo, person|
  click_link("Assign")
  check(person)
  click_button("Save")
end
