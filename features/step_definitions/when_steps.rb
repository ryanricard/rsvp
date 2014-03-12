Before do
  @response = { :select_fields => {}, :text_fields => {} }
end

When(/^I visit "(.*?)"$/) do |path|
  visit path
end

When(/^I click the link "(.*?)"$/) do |name|
  click_link name
end

When(/^I click the button "(.*?)"$/) do |name|
  click_button name
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field_name, value|
  @response[:text_fields][field_name] = value
  fill_in field_name, :with => value
end

When(/^I choose "(.*?)" attending$/) do |total_attending|
  choose total_attending
end

When(/^I fill in my RSVP Code$/) do
  fill_in "RSVP Code", :with => @invitation.rsvp_code
end

When(/^I fill in a unknown RSVP Code$/) do
  step 'I visit "/rsvp"'
  step 'I fill in "Enter your RSVP Code" with "unknown code"'
  step 'I click the button "Begin RSVP"'
end