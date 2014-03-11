Feature: AccessAttempt
  I should be locked for a duration of time if I attempt to authenticate too many times.

    Scenario: A public user attempts to authenticate more than seven times
      Given I am a public user
      When I fill in a unknown RSVP Code
      Then I should not see text stating "You surpassed the attempt threshold."
      When I fill in a unknown RSVP Code
      Then I should not see text stating "You surpassed the attempt threshold."
      When I fill in a unknown RSVP Code
      Then I should not see text stating "You surpassed the attempt threshold."
      When I fill in a unknown RSVP Code
      Then I should not see text stating "You surpassed the attempt threshold."
      When I fill in a unknown RSVP Code
      Then I should not see text stating "You surpassed the attempt threshold."
      When I fill in a unknown RSVP Code
      Then I should not see text stating "You surpassed the attempt threshold."
      When I fill in a unknown RSVP Code
      Then I should see text stating "You surpassed the attempt threshold."