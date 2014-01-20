require 'spec_helper'

module Rsvp
  describe "Person associations" do
    it "should have many memberships" do
      Person.reflect_on_association(:memberships).macro.should eq(:has_many)
    end
    it "should have many families" do
      Person.reflect_on_association(:families).macro.should eq(:has_many)
    end
  end
end
