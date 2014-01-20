require 'spec_helper'

module Rsvp
  describe "Invitation associations" do
    it "should belong to family" do
      Invitation.reflect_on_association(:family).macro.should eq(:belongs_to)
    end
    it "should have one response" do
      Invitation.reflect_on_association(:response).macro.should eq(:has_one)
    end
  end
end
