class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Object successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :user_id)
  end
end
