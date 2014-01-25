Then(/^I should be located at "(.*?)"$/) do |path|
  current_path.should eq(path)
end

Then(/^I should see text stating "(.*?)"$/) do |value|
  expect(page).to have_text value
end

Then(/^I should not see a Yes form displayed$/) do
  page.should have_selector('#yes-container', visible: false)
end

Then(/^I should not see a No form displayed$/) do
  page.should have_selector('#no-container', visible: false)
end

Then(/^I should see a Yes form displayed$/) do
  page.should have_selector('#yes-container', visible: true)
end

Then(/^I should see a No form displayed$/) do
  page.should have_selector('#no-container', visible: true)
end

Then(/^I should see a Yes form displayed with my entered values$/) do
  step 'I should see a Yes form displayed'
  step 'I should see a form populated with my entered values'
end

Then(/^I should see a form populated with my entered values$/) do
  @response[:text_fields].each_pair do |key, value|
    expect(page.has_field?(key, :with => value)).to be_true
  end
  @response[:select_fields].each_pair do |key, value|
    expec(page.has_select?(key, :selected => value)).to be_true
  end
end

Then(/^I should see my Yes response in text$/) do
  response = @invitation.responses.last
  expect(page).to have_text "Total attending: #{response.total_attending}"
  expect(page).to have_text "Email: #{response.email}"
  expect(page).to have_text "Comment: #{response.comment}"
end

Then(/^I should see my No response in text$/) do
  expect(page).to have_text "No, I will not be attending."
end

Then(/^I should not see a Total Attending drop down$/) do
  page.should_not have_selector('#no-container select')
end

Then(/^I should see a confirmation page with the number attending I selected$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a Total Attending drop down with options not exceeding my invites$/) do
  options = @invitation.total_invite_options
  options.max.should eq(@invitation.total_invited)
  page.has_select?("Total attending", :with_options => options)
end