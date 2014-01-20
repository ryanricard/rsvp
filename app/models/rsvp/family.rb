module Rsvp
  class Family < ActiveRecord::Base
    has_many :invitations
    has_many :members
    has_many :people, :through => :members
    has_one :salutation
  end
end
