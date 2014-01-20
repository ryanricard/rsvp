require 'spec_helper'

module Rsvp
  describe "Salutation associations" do
    it "should belong to family" do
      Salutation.reflect_on_association(:family).macro.should eq(:belongs_to)
    end
  end
end
