require 'spec_helper'

module Rsvp
  describe "Member associations" do
    it "should belong to family" do
      Member.reflect_on_association(:family).macro.should eq(:belongs_to)
    end
    it "should belong to person" do
      Member.reflect_on_association(:person).macro.should eq(:belongs_to)
    end
  end
end
