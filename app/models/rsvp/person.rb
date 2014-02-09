module Rsvp
  class Person < ActiveRecord::Base
    attr_accessible :first_name, :gender_type, :last_name, :suffix
    has_many :memberships, :class_name => "Member"
    has_many :families, :through => :memberships

    validates :first_name, :presence => true
    validates :last_name, :presence => true


    def self.adult_males
      where("gender_type = ?", Gender::AdultMale.to_s)
    end

    def self.adult_females
      where("gender_type = ?", Gender::AdultFemale.to_s)
    end
  end
end
