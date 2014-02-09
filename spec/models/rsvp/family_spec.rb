require 'spec_helper'

module Rsvp
  describe "Family associations" do
    it "should have many invitations" do
      Family.reflect_on_association(:invitations).macro.should eq(:has_many)
    end
    it "should have many members" do
      Family.reflect_on_association(:members).macro.should eq(:has_many)
    end
    it "should have many people" do
      Family.reflect_on_association(:people).macro.should eq(:has_many)
    end
    it "should instantiate people of appropriate types" do
      salutation = Salutation.subclasses.first
      gender = Gender.subclasses.first
      family = Family.create(salutation_type: salutation)
      person = family.people.create({ :gender_type => gender.to_s })
      person.gender_type.should eq(gender)
    end
  end
  describe "Family compositions" do
    it "should constantize a salutation type of appropriate type" do
      salutation = Salutation.subclasses.first
      family = Family.new(salutation_type: salutation)
      family.save
      family.salutation_type.should eq(salutation)
    end
  end
  describe "Family Salutation" do
    it "should be required" do
      salutation = Salutation.subclasses.first
      family = Family.create
      expect(family.persisted?).to be_false
      expect(family.errors.get(:salutation_type)).to include("can't be blank")
    end
    it "should correctly instaniate a salutation" do
      person = Person.create(gender_type: Gender::AdultMale, first_name: "John", last_name: "Smith")
      family = Family.new(salutation_type: Salutation::SingleMale)
      family.people << person
      family.save(validate: false)
      expect(family.salutation).to eq("Mr. John Smith")
    end
  end
end
