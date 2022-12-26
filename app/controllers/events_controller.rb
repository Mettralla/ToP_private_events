class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new destroy update edit]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Object was successfully updated"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:success] = "Object was successfully updated"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to root_path
  end
  

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :user_id)
  end
end
