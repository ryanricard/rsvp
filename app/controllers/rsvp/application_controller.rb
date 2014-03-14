module Rsvp
  class ApplicationController < ActionController::Base
    protect_from_forgery

    private

    def require_session
      unless session[:invitation_id]
        flash[:alert] = "You must begin a RSVP session to access that page."
        redirect_to root_path
      end
    end

  end
end
