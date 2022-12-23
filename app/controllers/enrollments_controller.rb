class EnrollmentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]

  def new
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.find(params[:id])
    @event.attendees << current_user
    flash[:notice] = 'You have registered for the event'
    redirect_to root_path
  end
end
