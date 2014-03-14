module Rsvp
  class SessionController < ApplicationController
    before_filter :require_session, :only => [:destroy]
    before_filter :get_access_attempt
    before_filter :flash_message_when_locked, :only => [:index]
    before_filter :redirect_when_locked, :only => [:create]

    # GET /session
    def index; end

    # POST /session
    def create
      invitation = Invitation.find_by_rsvp_code(params[:rsvp_code])
      if invitation
        session[:invitation_id] = invitation.id
        redirect_to (invitation.responses.any? ? show_response_index_path : response_index_path)
      else
        if exceeded_access_attempts?
          redirect_when_locked
        else
          flash.alert = "Oops!! The code you entered is not valid. Please try again."
          redirect_to root_path
        end
      end
    end

    # DELETE /session
    def destroy
      session[:invitation_id] = nil
      redirect_after_destroy
    end

    private

    # Allows for easy override from wrapping application
    def redirect_after_destroy
      redirect_to root_path, notice: "Thank you for your response!"
    end

    def get_access_attempt
      @access_attempt ||= AccessAttempt.find_or_create_by(remote_ip: request.remote_ip)
    end

    def exceeded_access_attempts?
      @access_attempt.record_attempt
      @access_attempt.locked?
    end

    def redirect_when_locked
      if @access_attempt.locked?
        redirect_to root_path
      end
    end

    def flash_message_when_locked
      if @access_attempt.locked?
        flash.now[:alert] = "You surpassed the attempt threshold. You may try again on #{@access_attempt.locked_until.strftime('%A, %B %d at %l:%M %p').gsub(/[\ ]{2}/, " ")}."
      end
    end
  end
end