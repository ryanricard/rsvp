module Rsvp
  class Person < ActiveRecord::Base
    self.inheritance_column = :gender
    attr_accessible :first_name, :gender, :last_name, :suffix
    has_many :memberships, :class_name => "Member"
    has_many :families, :through => :memberships

    validates :first_name, :presence => true
    validates :last_name, :presence => true


    def self.adult_males
      where("gender = ?", Person::AdultMale.to_s)
    end

    def self.adult_females
      where("gender = ?", Person::AdultFemale.to_s)
    end
  end
end
