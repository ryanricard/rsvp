module Rsvp
  class SessionController < ApplicationController
    skip_before_filter :require_session, :only => [:index, :create]

    # GET /session
    def index; end

    # POST /session
    def create
      invitation = Invitation.find_by_rsvp_code(params[:rsvp_code])
      if invitation
        session[:invitation_id] = invitation.id
        redirect_to (invitation.responses.any? ? show_response_index_path : response_index_path)
      else
        flash.alert = "Oops!! The code you entered is not valid. Please try again."
        redirect_to root_path
      end
    end

    # DELETE /session
    def destroy
      session[:invitation_id] = nil
      redirect_to root_path, notice: "Thank you for your response!"
    end
  end
end