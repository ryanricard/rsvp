require 'spec_helper'

module Rsvp
  describe SessionController do
    routes { Engine.routes }

    before(:each) do
      @allowed_attempts = AccessAttempt.new.allowed_attempts
    end

    it "sanity checks that allowed attempts is a number greater than zero" do
      expect(@allowed_attempts).to be > 0
    end

    it "only attempts to authenticate code " do
      # The times Invitation model is queried should match allowed attempts
      Invitation.should_receive(:find_by_rsvp_code).exactly(@allowed_attempts).times
      # Assult controller create to simulate brute force
      50.times do
        post "create" , :rsvp_code => "unknown code"
      end
    end
  end
end
