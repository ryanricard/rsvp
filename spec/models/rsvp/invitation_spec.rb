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
  describe "Invitation compositions" do
    it "should constantize a salutation type of appropriate type" do
      salutation = Salutation.subclasses.first
      invitation = Invitation.new(salutation_type: salutation)
      invitation.save
      invitation.salutation_type.should eq(salutation)
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
      salutation = Salutation.subclasses.first
      invitation_params = { :salutation_type => salutation, :total_invited => 2, :rsvp_code => "ASDFGHJ" }
      # First insert should be successful
      invite1 = Invitation.create(invitation_params)
      expect(invite1.persisted?).to be_true
      # Second insert should fail
      invite2 = Invitation.create(invitation_params)
      expect(invite2.persisted?).to be_false
      expect(invite2.errors.get(:rsvp_code)).to include("has already been taken")
    end
  end
  describe "Invitation Salutation" do
    it "should be required" do
      salutation = Salutation.subclasses.first
      invitation = Invitation.create
      expect(invitation.persisted?).to be_false
      expect(invitation.errors.get(:salutation_type)).to include("can't be blank")
    end
    it "should correctly instaniate a salutation" do
      family = Family.new(validate: false)
      family.save(validate: false)
      family.invitations.create(salutation_type: Salutation::SingleMaleAndGuest)
      family.people.create(gender_type: Gender::AdultMale.to_s, first_name: "John", last_name: "Smith")
      expect(family.invitations.first.salutation.to_s).to eq("Mr. John Smith and guest")
    end
  end
end
