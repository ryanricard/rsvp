module Rsvp
  class Family < ActiveRecord::Base
    attr_accessible :salutation_type, :city, :postal_code, :state, :street_1, :street_2
    has_many :invitations
    has_many :members
    has_many :people, :through => :members

    validates :salutation_type, :presence => true

    include SalutationMixin

    def family
      self
    end
  end
end
