module Rsvp
  class Invitation < ActiveRecord::Base
    belongs_to :family
    has_one :response
  end
end
