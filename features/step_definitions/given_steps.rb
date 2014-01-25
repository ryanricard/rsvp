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

Given(/^I have submitted my RSVP code$/) do
  step 'I visit "/rsvp"'
  step 'I fill in my RSVP Code'
  step 'I click the button "Begin RSVP"'
end

Given(/^I have began the RSVP process$/) do
  step 'I have submitted my RSVP code'
end

Given(/^I return to change my response$/) do
  step 'I have submitted my RSVP code'
end

Given(/^I have responded Yes$/) do
  step 'I have began the RSVP process'
  step 'I click the link "Yes"'
  step 'I click the button "Submit RSVP"'
  step 'I click the link "I\'m done!"'
end

Given(/^I have responded No$/) do
  step 'I have began the RSVP process'
  step 'I click the link "No"'
  step 'I click the button "Submit RSVP"'
  step 'I click the link "I\'m done!"'
end