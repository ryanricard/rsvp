module Rsvp
  class Response < ActiveRecord::Base
    attr_accessible :comment, :email, :total_attending
    belongs_to :invitation

    validate :validate_total_attending_if_entered
    validate :validate_email_if_entered

    def validate_total_attending_if_entered
      if invitation.total_invited < total_attending.to_i
        errors.add(:total_attending, "cannot be greater than total invited")
      end
    end

    def validate_email_if_entered
      if !(email.blank? || email.match(/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i))
        errors.add(:email, "is invalid")
      end
    end
  end
end
