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
      subclass = Person.subclasses.first
      family = Family.create
      person = family.people.create({ :gender => subclass.to_s })
      person.class.should eq(subclass)
    end
    it "should instantiate a salutation of appropriate type" do
      subclass = Salutation.subclasses.first
      family = Family.create
      salutation = family.create_salutation({ :type => subclass.to_s })
      salutation.class.should eq(subclass)
    end
  end
end
