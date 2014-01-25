module Rsvp
  class Response < ActiveRecord::Base
    attr_accessible :comment, :email, :total_attending
    belongs_to :invitation

    validates :total_attending, :presence => true
    validate :validate_total_attending
    validate :validate_email_if_entered

    def validate_total_attending
      if invitation.total_invited < total_attending.to_i
        errors.add(:total_attending, "cannot be greater than total invited")
      end
    end

    def validate_email_if_entered
      if email.present? && !email.match(/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i)
        errors.add(:email, "is invalid")
      end
    end

    def is_yes?
      total_attending.to_i > 0
    end

    def is_no?
      total_attending.to_i == 0 && !total_attending.nil?
    end
  end
end
