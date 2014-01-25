Feature: Session
  In order to RSVP, I must authenticate with a valid RSVP code

    Scenario: A request is made to a page that requires a session
      Given I am a public user
      When I visit "/rsvp/response"
      Then I should see text stating "You must begin a RSVP session to access that page."
      When I visit "/rsvp/response/confirmation"
      Then I should see text stating "You must begin a RSVP session to access that page."
      When I visit "/rsvp/response/overview"
      Then I should see text stating "You must begin a RSVP session to access that page."

    Scenario: An invitee submits an unknown RSVP code is denied access
      Given I am a public user
      When I visit "/rsvp"
        And I fill in "Enter your RSVP Code" with "unknown code"
        And I click the button "Begin RSVP"
      Then I should be located at "/rsvp/"
        And I should see text stating "Oops!! The code you entered is not valid. Please try again."

    Scenario: An invitee submits a known RSVP code is allowed access
      Given I have an invitation for a single person
      # Ensure a session is not estabolished
      When I visit "/rsvp/response"
      Then I should see text stating "You must begin a RSVP session to access that page."
      When I visit "/rsvp"
        And I fill in my RSVP Code
        And I click the button "Begin RSVP"
      Then I should be located at "/rsvp/response"
        And I should see text stating "Hi, Mr. Jerad Smith! Thank you for choosing to RSVP to our special day."

    Scenario: An invitee is allowed access and then ends their session
    Given I have an invitation for a single person
      And I have began the RSVP process
    Then I should be located at "/rsvp/response"
    When I click the link "No"
    Then I should see a No form displayed
    When I click the link "No"
      And I click the button "Submit RSVP"
    Then I should be located at "/rsvp/response/confirmation"
    When I click the link "I'm done!"
    Then I should be located at "/rsvp/"
      And I should see text stating "Thank you for your response!"
    When I visit "/rsvp/response"
    Then I should see text stating "You must begin a RSVP session to access that page."

  Scenario: An invitee returns but chooses to not change their response
    Given I have an invitation for a single person
        And I have responded Yes
        And I return to change my response
    Then I should be located at "/rsvp/response/overview"
      And I should see text stating "Hi, Mr. Jerad Smith! Welcome back."
    When I click the link "I'm done!"
    Then I should be located at "/rsvp/"
      And I should see text stating "Thank you for your response!"
