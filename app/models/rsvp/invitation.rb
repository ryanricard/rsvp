module Rsvp
  class Invitation < ActiveRecord::Base
    attr_accessible :rsvp_code, :total_invited
    belongs_to :family
    has_many :responses

    validates :rsvp_code, :presence => true, :uniqueness => true, :length => { is: 7 }
    validates :total_invited, :inclusion => 1..10

    def total_invite_options
      (1..total_invited).to_a
    end
  end
end
