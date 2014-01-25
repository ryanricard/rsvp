module Rsvp
  class ResponseController < ApplicationController
    before_filter :prepare_instance_vars, :only => [:index, :show, :confirmation]

    # GET /response
    def index; end

    # POST /response
    def create
      @invitation = Invitation.find(session[:invitation_id])
      @response = @invitation.responses.build(params[:response])
      if @response.save
        redirect_to confirmation_response_index_path
      else
        render :action => :index
      end
    end

    # GET /response/overview
    def show; end

    # GET /response/confirmation
    def confirmation; end

    private

    def prepare_instance_vars
      @invitation = Invitation.find(session[:invitation_id])
      @invitation.responses.build unless @invitation.responses.any?
      @response = @invitation.responses.last
    end
  end
end