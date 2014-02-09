module Rsvp
  class Person < ActiveRecord::Base
    attr_accessible :first_name, :gender_type, :last_name, :suffix
    has_many :memberships, :class_name => "Member"
    has_many :families, :through => :memberships

    validates :gender_type, :presence => true
    validates :first_name, :presence => true
    validates :last_name, :presence => true


    def self.adult_males
      where("gender_type = ?", Gender::AdultMale.to_s)
    end

    def self.adult_females
      where("gender_type = ?", Gender::AdultFemale.to_s)
    end

    def gender_type=(klass)
      write_attribute(:gender_type, klass.to_s)
    end

    def gender_type
      read_attribute(:gender_type).try(:constantize)
    end
  end
end
