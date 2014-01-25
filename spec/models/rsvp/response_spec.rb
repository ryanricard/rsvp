require 'spec_helper'

module Rsvp
  describe "Response associations" do
    it "should belong to invitation" do
      Response.reflect_on_association(:invitation).macro.should eq(:belongs_to)
    end
  end
  describe "Response boolean state" do
    it "should be neither yes or no after being built" do
      response = Response.new
      expect(response.total_attending).to be_nil
      expect(response.is_yes?).to be_false
      expect(response.is_no?).to be_false
    end
    it "should be not be both yes and no" do
      response = Response.new({ total_attending: 0})
      expect(response.is_yes?).to be_false
      expect(response.is_no?).to be_true
    end
    it "should be not be both yes and no" do
      response = Response.new({ total_attending: 1})
      expect(response.is_yes?).to be_true
      expect(response.is_no?).to be_false
    end
  end
  describe "Response validations" do
    before :each do
      @response = Response.new()
      @response.stub(:invitation){ Invitation.new({ total_invited: 2 }) }
    end
    it "is invalid when total_attending is a string" do
      @response.total_attending = "Foo"
      expect(@response.total_attending).to eq(0)
    end
    it "requires total_attending" do
      @response.save
      expect(@response.errors.get(:total_attending)).to include("can't be blank")
    end
    it "is valid when total_attending is zero" do
      @response.total_attending = 0
      @response.save
      expect(@response.errors.get(:total_attending)).to be_nil
    end
    it "is valid when total_attending is greater than zero, but less than total_invited" do
      @response.total_attending = 1
      @response.save
      expect(@response.errors.get(:total_attending)).to be_nil
    end
    it "is valid when total_attending is greater than zero and equal to total_invited" do
      @response.total_attending = 2
      @response.save
      expect(@response.errors.get(:total_attending)).to be_nil
    end
    it "is invalid when total_attending is greater than total_invited" do
      @response.total_attending = 3
      @response.save
      expect(@response.errors.get(:total_attending)).to include("cannot be greater than total invited")
    end
    it "validates invalid emails correctly" do
      @response.email = "foo @bar.com"
      @response.save
      expect(@response.errors.get(:email)).to include("is invalid")
    end
    it "validates valid emails correctly" do
      @response.email = "foo@bar.com"
      @response.save
      expect(@response.errors.get(:email)).to be_nil
    end
  end
end
