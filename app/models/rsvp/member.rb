module Rsvp
  class Member < ActiveRecord::Base
    belongs_to :family
    belongs_to :person
  end
end
