Feature: Reply
  The reply page behaves correctly for all response scenarios.

  # Reply page inital state
  Scenario: An invitee authenticates for the first time and is routed to the reply page in its intital state
    Given I have an invitation for a single person
        And I have began the RSVP process
    Then I should be located at "/rsvp/response"
      And I should see text stating "Hi, Mr. Jerad Smith! Thank you for choosing to RSVP to our special day."
      And I should not see a Yes form displayed
      And I should not see a No form displayed

  # Yes form validation for a single person
  Scenario: An invitee submits a Yes response with an invalid email
    Given I have an invitation for a single person
      And I have began the RSVP process
    When I click the link "Yes"
      And I fill in "Email" with "john.locke @examplecom"
      And I click the button "Submit RSVP"
    Then I should be located at "/rsvp/response"
      And I should see text stating "Email is invalid"
      And I should not see a No form displayed
      And I should see a Yes form displayed with my entered values
    When I fill in "Email" with "john.locke@example.com"
      And I fill in "Comment" with "Amanda you are going to be the most beautiful bride ever!"
      And I click the button "Submit RSVP"
    Then I should be located at "/rsvp/response/confirmation"
      And I should see text stating "Awesome!! We look forward to seeing you there!"
      # And I should see text stating "You may change your RSVP anytime before [due date]"

  # Yes form validation for a family
  Scenario: An invitee submits a Yes response without selecting Total Attending
    Given I have an invitation for a husband, wife, and family
      And I have began the RSVP process
    When I click the link "Yes"
      And I click the button "Submit RSVP"
    Then I should be located at "/rsvp/response"
      And I should see text stating "Total attending can't be blank"
    When I choose "4 people" attending
      And I fill in "Email" with "john.locke@example.com"
      And I fill in "Comment" with "Amanda you are going to be the most beautiful bride ever!"
      And I click the button "Submit RSVP"
    Then I should be located at "/rsvp/response/confirmation"
      And I should see text stating "Awesome!! We look forward to seeing you there!"
      # And I should see text stating "You may change your RSVP anytime before [due date]"

  # Yes response
  Scenario: An invitee submits a Yes response
    Given I have an invitation for a single person
      And I have began the RSVP process
    When I click the link "Yes"
      And I click the button "Submit RSVP"
    Then I should be located at "/rsvp/response/confirmation"
      And I should see text stating "Awesome!! We look forward to seeing you there!"
      # And I should see text stating "You may change your RSVP anytime before [due date]"

  # No response
  Scenario: An invitee submits a No response
    Given I have an invitation for a single person
      And I have began the RSVP process
    When I click the link "No"
    Then I should see a No form displayed
      And I should see text stating "No, I will not be attending."
    When I click the button "Submit RSVP"
    Then I should be located at "/rsvp/response/confirmation"
      And I should see text stating "Aw shucks. You will be missed."
      # And I should see text stating "You may change your RSVP anytime before [due date]"

    # Yes/No form display toggling
    Scenario: An invitee toggles between forms clicking Cancel on each
      Given I have an invitation for a single person
        And I have began the RSVP process
      When I click the link "Yes"
        And I click the button "Cancel"
      Then I should be located at "/rsvp/response"
        And I should not see a No form displayed
        And I should not see a Yes form displayed
      When I click the link "No"
        And I click the button "Cancel"
      Then I should be located at "/rsvp/response"
        And I should not see a No form displayed
        And I should not see a Yes form displayed

  # Returning invitee changes Yes to No
  Scenario: An invitee returns to change their Yes response to No
    Given I have an invitation for a single person
        And I have responded Yes
        And I return to change my response
    Then I should be located at "/rsvp/response/overview"
      And I should see text stating "Hi, Mr. Jerad Smith! Welcome back."
      And I should see my Yes response in text
    When I click the link "Change my response"
    Then I should be located at "/rsvp/response"
      And I should not see a No form displayed
      And I should see a Yes form displayed with my entered values
    When I click the link "No"
    Then I should see a No form displayed
      And I should see text stating "No, I will not be attending."
    When I click the button "Submit RSVP"
    Then I should be located at "/rsvp/response/confirmation"
      And I should see text stating "Aw shucks. You will be missed."
      # And I should see text stating "You may change your RSVP anytime before [due date]"

  # Returning invitee changes No to Yes
  Scenario: An invitee returns to change their No response to Yes
    Given I have an invitation for a single person
        And I have responded No
        And I return to change my response
    Then I should be located at "/rsvp/response/overview"
      And I should see text stating "Hi, Mr. Jerad Smith! Welcome back."
      And I should see my No response in text
    When I click the link "Change my response"
    Then I should be located at "/rsvp/response"
      And I should see a No form displayed
      And I should not see a Yes form displayed
    When I click the link "Yes"
      And I click the button "Submit RSVP"
    Then I should be located at "/rsvp/response/confirmation"
      And I should see text stating "Awesome!! We look forward to seeing you there!"
      # And I should see text stating "You may change your RSVP anytime before [due date]"

  Scenario: Invitees' with one invite may only respond for a count of one
    Given I have an invitation for a single person
      And I have began the RSVP process
    When I click the link "Yes"
    Then I should not see a No form displayed
      And I should see a Yes form displayed
      And I should not see a Total Attending drop down
    When I click the button "Submit RSVP"
    Then I should see my Yes response in text

  Scenario: A husband, wife, and family choose to all attend
    Given I have an invitation for a husband, wife, and family
      And I have began the RSVP process
    When I click the link "Yes"
    Then I should see a Total Attending drop down with options not exceeding my invites
    When I choose "4 people" attending
      And I click the button "Submit RSVP"
    Then I should see my Yes response in text

  Scenario: A husband, wife, and family choose to not all attend
    Given I have an invitation for a single person and guest
      And I have began the RSVP process
    When I click the link "Yes"
    Then I should see a Total Attending drop down with options not exceeding my invites
    When I choose "1 person" attending
      And I click the button "Submit RSVP"
    Then I should see my Yes response in text