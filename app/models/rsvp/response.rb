module Rsvp
  class Response < ActiveRecord::Base
    belongs_to :invitation
  end
end
