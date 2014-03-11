module Rsvp
  class SessionController < ApplicationController
    skip_before_filter :require_session, :only => [:index, :create]
    before_filter :get_access_attempt
    before_filter :redirect_locked, :only => [:create]

    # GET /session
    def index; end

    # POST /session
    def create
      invitation = Invitation.find_by_rsvp_code(params[:rsvp_code])
      if invitation
        session[:invitation_id] = invitation.id
        redirect_to (invitation.responses.any? ? show_response_index_path : response_index_path)
      else
        record_failed_access_attempt
        flash.alert = "Oops!! The code you entered is not valid. Please try again."
        redirect_to root_path
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

    def record_failed_access_attempt
      @access_attempt.record_attempt
    end

    def redirect_locked
      if @access_attempt.locked?
        flash[:alert] = "You surpassed the attempt threshold. You may try again on #{@access_attempt.locked_until.strftime('%B %d at %I:%M %p')}."
        redirect_to root_path
      end
    end
  end
end