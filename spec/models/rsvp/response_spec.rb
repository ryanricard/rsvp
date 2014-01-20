require 'spec_helper'

module Rsvp
  describe "Response associations" do
    it "should belong to invitation" do
      Response.reflect_on_association(:invitation).macro.should eq(:belongs_to)
    end
  end
end
