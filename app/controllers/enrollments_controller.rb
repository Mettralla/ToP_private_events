class EnrollmentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new destroy]

  def new
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.find(params[:id])
    @event.attendees << current_user
    flash[:notice] = 'You have registered for the event'
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.attendees.destroy(current_user)
      flash[:success] = "You are no longer attending this event"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to root_path
  end
end
