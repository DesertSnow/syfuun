Given /^I have a person "(.*?)"$/ do |name|
  Person.create(name:name)
end
