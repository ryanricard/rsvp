module Rsvp
  class AccessAttempt < ActiveRecord::Base
    attr_accessible :remote_ip

    ALLOWED_ATTEMPTS = 7
    LOCK_DURATION = 15

    def record_attempt
      self.failed_attempts += 1
      if failed_attempts >= allowed_attempts
        self.locked_until = Time.now + lock_duration
        self.locks_incurred += 1
      end
      self.save
    end

    def locked?
      unless locked_until.nil?
        return locked_until >= Time.now
      else
        return false
      end
    end

    def allowed_attempts
      ALLOWED_ATTEMPTS * multiplier
    end

    private

    def multiplier
      locks_incurred + 1
    end

    def lock_duration
      (LOCK_DURATION * (multiplier**3)).minutes
    end
  end
end
