Given(/^I am a public user$/) do
  # Do nothing
end

Given(/^I have an invitation for a single person$/) do
  Fe.load_db(:invitation_to_a_single_male)
  @invitation = Rsvp::Invitation.first
end

Given(/^I have an invitation for a single person and guest$/) do
  Fe.load_db(:invitation_to_a_single_male_and_guest)
  @invitation = Rsvp::Invitation.first
end

Given(/^I have an invitation for a husband, wife, and family$/) do
  Fe.load_db(:husband_wife_and_family)
  @invitation = Rsvp::Invitation.first
end

Given(/^I have began the RSVP process$/) do
  step 'I visit "/rsvp"'
  step 'I fill in my RSVP Code'
  step 'I click the button "Begin RSVP"'
  step 'I should be located at "/rsvp/reply"'
end

Given(/^I fill in my RSVP Code$/) do
  fill_in "RSVP Code", :with => @invitation.rsvp_code
end

When(/^I visit "(.*?)"$/) do |path|
  visit path
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field_name, value|
  fill_in field_name, :with => value
end

When(/^I click the button "(.*?)"$/) do |name|
  click_button name
end

When(/^I click the link "(.*?)"$/) do |name|
  click_link name
end

When(/^I click the Yes form "(.*?)" button$/) do |name|
  find("div.rsvp-yes").click_button name
end

When(/^I click the No form "(.*?)" button$/) do |name|
  find("div.rsvp-no").click_button name
end

When(/^I fill in total invited with the max number invited$/) do
  select(@invitation.total_invited, :from => 'Total attending')
end

Then(/^I should be located at "(.*?)"$/) do |path|
  current_path.should eq(path)
end

Then(/^I should see text stating "(.*?)"$/) do |value|
  expect(page).to have_text value
end

Then(/^I should not see a Yes form displayed$/) do
  page.should have_selector('div.rsvp-yes', visible: false)
end

Then(/^I should not see a No form displayed$/) do
  page.should have_selector('div.rsvp-no', visible: false)
end

Then(/^I should see a Yes form displayed$/) do
  page.should have_selector('div.rsvp-yes', visible: true)
end

Then(/^I should see a No form displayed$/) do
  page.should have_selector('div.rsvp-no', visible: true)
end

Then(/^I should not see a Total Attending drop down$/) do
  page.should_not have_selector('div.rsvp-no select')
end

Then(/^I should see a Total Attending drop down with options not exceeding my invites$/) do
  options = @invitation.total_invite_options
  options.max.should eq(@invitation.total_invited)
  page.has_select?("Total attending", :with_options => options)
end