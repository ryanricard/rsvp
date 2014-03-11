require 'spec_helper'

module Rsvp
  describe AccessAttempt do
    before(:each) do
      @access_attempt = AccessAttempt.new
      @allowed_attempts = 7
      @lock_duration = 15
    end

    it "should be initialized with the proper defaults" do
      expect(@access_attempt.failed_attempts).to eq(0)
      expect(@access_attempt.locks_incurred).to eq(0)
      expect(@access_attempt.locked_until).to be_nil
      expect(@access_attempt.locked?).to be_false
    end

     it "should increment failed attempts when record attempt is called" do
      10.times do |i|
        @access_attempt.record_attempt
        expect(@access_attempt.failed_attempts).to eq(i + 1)
      end
    end

    it "increments locks incurred when attempts exhausted repeatedly" do
      expect(@access_attempt.locked?).to be_false
      5.times do |i|
        (@allowed_attempts - 1).times { @access_attempt.record_attempt }
        expect(@access_attempt.locks_incurred).to eq(i)
        @access_attempt.record_attempt
        expect(@access_attempt.locks_incurred).to eq(i + 1)
      end
    end

    it "increases locked until time when attempts exhausted repeatedly" do
      expect(@access_attempt.locked?).to be_false
      5.times do |i|
        @allowed_attempts.times { @access_attempt.record_attempt }
        lock_duration = ((@access_attempt.locked_until.localtime - Time.now)/60).ceil
        expect(lock_duration).to eq((@lock_duration * ((i + 1)**3)))
      end
    end

    it "should lock when attempts exhausted repeatedly" do
      5.times do |i|
        expect(@access_attempt.locked?).to be_false
        @allowed_attempts.times { @access_attempt.record_attempt }
        expect(@access_attempt.locked?).to be_true
        @access_attempt.locked_until = nil
      end
    end
  end
end
