module Rsvp
  class Person < ActiveRecord::Base
    has_many :memberships, :class_name => "Member"
    has_many :families, :through => :memberships

    self.inheritance_column = :gender

    def self.adult_males
      where("gender = ?", Person::AdultMale.to_s)
    end

    def self.adult_females
      where("gender = ?", Person::AdultFemale.to_s)
    end
  end
end
