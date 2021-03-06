module Rsvp
  class Family < ActiveRecord::Base
    attr_accessible :city, :postal_code, :state, :street_1, :street_2
    has_many :invitations
    has_many :members
    has_many :people, :through => :members

    include SalutationMixin

    def family
      self
    end
  end
end
