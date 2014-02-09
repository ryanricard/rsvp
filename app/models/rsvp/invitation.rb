module Rsvp
  class Invitation < ActiveRecord::Base
    attr_accessible :salutation_type, :rsvp_code, :total_invited
    belongs_to :family
    has_many :responses

    validates :rsvp_code, :presence => true, :uniqueness => true, :length => { is: 7 }
    validates :total_invited, :presence => true, :inclusion => 1..10

    include SalutationMixin

    def total_invite_options
      (1..total_invited).to_a
    end
  end
end
