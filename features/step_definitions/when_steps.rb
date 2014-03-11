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

When(/^I select the max number in the Total Attending drop down$/) do
  field_name = "Total attending"
  value = @invitation.total_invited
  @response[:select_fields][field_name] = value
  select(value, :from => field_name)
end

When(/^I select the one less than the max number in the Total Attending drop down$/) do
  field_name = "Total attending"
  value = @invitation.total_invited-1
  @response[:select_fields][field_name] = value
  select(value, :from => field_name)
end

When(/^I fill in my RSVP Code$/) do
  fill_in "RSVP Code", :with => @invitation.rsvp_code
end

When(/^I fill in a unknown RSVP Code$/) do
  step 'I visit "/rsvp"'
  step 'I fill in "Enter your RSVP Code" with "unknown code"'
  step 'I click the button "Begin RSVP"'
end