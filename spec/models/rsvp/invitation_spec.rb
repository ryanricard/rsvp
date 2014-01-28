require 'spec_helper'

module Rsvp
  describe "Invitation associations" do
    it "should belong to family" do
      Invitation.reflect_on_association(:family).macro.should eq(:belongs_to)
    end
    it "should have one response" do
      Invitation.reflect_on_association(:responses).macro.should eq(:has_many)
    end
  end
  describe "Invitation RSVP Code" do
    it "should raise an exception when attempting to save a duplicate code without validation" do
      invitation_params = { :total_invited => 2, :rsvp_code => "ASDFGHJ" }
      # First insert should be successful
      expect{ Invitation.new(invitation_params).save(validate: false) }.not_to raise_exception
      # Second insert should fail
      expect{ Invitation.new(invitation_params).save(validate: false) }.to raise_exception(ActiveRecord::RecordNotUnique)
    end
    it "should be validated for uniquness" do
      invitation_params = { :total_invited => 2, :rsvp_code => "ASDFGHJ" }
      # First insert should be successful
      invite1 = Invitation.create(invitation_params)
      expect(invite1.persisted?).to be_true
      # Second insert should fail
      invite2 = Invitation.create(invitation_params)
      expect(invite2.persisted?).to be_false
      expect(invite2.errors.get(:rsvp_code)).to include("has already been taken")
    end
  end
end
