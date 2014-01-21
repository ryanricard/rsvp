Feature: RSVP
  In order to RSVP, I must submit a valid RSVP code and then complete the RSVP process

    Scenario: A invitee is presented useful instructions on how to begin RSVP process
      Given I am a public user
      When I visit "/rsvp"
      Then I should see text stating "This code was provided with your invitation."

    Scenario: A request is made to a page that requires a session
      Given I am a public user
      When I visit "/rsvp/reply"
      Then I should see text stating "You must begin a RSVP session to access that page."
      When I visit "/rsvp/confirmation"
      Then I should see text stating "You must begin a RSVP session to access that page."

    Scenario: A invitee submits an unknown RSVP code
      Given I am a public user
      When I visit "/rsvp"
        And I fill in "Enter your RSVP Code" with "unknown code"
        And I click the button "Begin RSVP"
      Then I should be located at "/rsvp/"
        And I should see text stating "Oops!! The code you entered is not valid. Please try again."

    Scenario: A invitee submits a known RSVP code
      Given I have an invitation for a single person
      When I visit "/rsvp"
        And I fill in my RSVP Code
        And I click the button "Begin RSVP"
      Then I should be located at "/rsvp/reply"
        # TODO: Figure out how to handle this text so salutation is not hardcoded
        And I should see text stating "Hi, Mr. Mike Crawford! Thank you for choosing to RSVP to our special day."
        And I should not see a Yes form displayed
        And I should not see a No form displayed

    Scenario: A invitee with a single invite chooses to respond Yes
      Given I have an invitation for a single person
        And I have began the RSVP process
      When I click the link "Yes"
      Then I should see a Yes form displayed
        And I should not see a Total Attending drop down

    Scenario: A invitee with a single invite submits a Yes response with an invalid email
      Given I have an invitation for a single person
        And I have began the RSVP process
      When I click the link "Yes"
        And I fill in "Email" with "john.locke @examplecom"
        And I click the Yes form "Submit RSVP" button
      Then I should be located at "/rsvp/reply"
        And I should see text stating "Email is invalid"

    Scenario: A invitee with a single invite submits a valid Yes response
      Given I have an invitation for a single person
        And I have began the RSVP process
      When I click the link "Yes"
        And I click the Yes form "Submit RSVP" button
      Then I should be located at "/rsvp/confirmation"
        And I should see text stating "Awesome!! We look forward to seeing you there!"
        # And I should see text stating "You may change your RSVP anytime before [due date]"

    Scenario: A invitee with a single invite submits a valid Yes response with a valid email and comment
      Given I have an invitation for a single person
        And I have began the RSVP process
      When I click the link "Yes"
        And I fill in "Email" with "john.locke@example.com"
        And I fill in "Comment" with "Amanda you are going to be the most beautiful bride ever!"
        And I click the Yes form "Submit RSVP" button
      Then I should be located at "/rsvp/confirmation"
        And I should see text stating "Awesome!! We look forward to seeing you there!"
        # And I should see text stating "You may change your RSVP anytime before [due date]"

    Scenario: A invitee with the option to bring a guest chooses to respond Yes
      Given I have an invitation for a single person and guest
        And I have began the RSVP process
      When I click the link "Yes"
      Then I should see a Total Attending drop down with options not exceeding my invites

    Scenario: A husband, wife, and family chooses to respond Yes
      Given I have an invitation for a husband, wife, and family
        And I have began the RSVP process
      When I click the link "Yes"
        And I fill in total invited with the max number invited
        And I click the Yes form "Submit RSVP" button
      Then I should be located at "/rsvp/confirmation"
        And I should see text stating "Awesome!! We look forward to seeing you there!"
        # And I should see text stating "You may change your RSVP anytime before [due date]"

    Scenario: A husband, wife, and family chooses to respond Yes and then cancels
      Given I have an invitation for a husband, wife, and family
        And I have began the RSVP process
      When I click the link "Yes"
        And I click the Yes form "Cancel" button
      Then I should be located at "/rsvp/reply"
        And I should not see a Yes form displayed

    Scenario: A invitee with a single invite chooses to respond No
      Given I have an invitation for a single person
        And I have began the RSVP process
      When I click the link "No"
      Then I should see a No form displayed
        And I should see text stating "No, I will not be attending."

    Scenario: A invitee with a single invite responds No
      Given I have an invitation for a single person
        And I have began the RSVP process
      When I click the link "No"
        And I click the No form "Submit RSVP" button
      Then I should be located at "/rsvp/confirmation"
        # And I should see text stating "If you change your mind..."
        # And I should see text stating "You may change your RSVP anytime before [due date]"

    Scenario: A invitee with multiple invites chooses to respond No and then cancels
      Given I have an invitation for a husband, wife, and family
        And I have began the RSVP process
      When I click the link "No"
        And I click the No form "Cancel" button
      Then I should be located at "/rsvp/reply"
        And I should not see a No form displayed