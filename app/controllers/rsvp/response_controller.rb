module Rsvp
  class ResponseController < ApplicationController

    skip_before_filter :require_session, :only => [:index, :create]

    # GET /rsvp
    def index
      @invitation = Invitation.new
    end

    # POST /rsvp
    def create
      invitation = Invitation.find_by_rsvp_code(params[:invitation][:rsvp_code])
      if invitation
        session[:invitation_id] = invitation.id
        redirect_to reply_path
      else
        flash.alert = "Oops!! The code you entered is not valid. Please try again."
        redirect_to root_path
      end
    end

    # GET /rsvp/reply
    def edit
      @invitation = Invitation.find(session[:invitation_id])
    end

    # PUT /rsvp/reply
    def update
      @invitation = Invitation.find(session[:invitation_id])

      if @invitation.build_response(params[:response]).save
        redirect_to confirmation_path
      else
        render :action => :edit
      end
    end

    # GET /rsvp/confirmation
    def confirmation
      @invitation = Invitation.find(session[:invitation_id])
      session[:invitation_id] = nil

      if @invitation.response.total_attending.to_i > 0
        render :yes_confirmation
      else
         render :no_confirmation
      end
    end

  end
end