class UsersController < ApplicationController
  def show
    @user_events = Event.all.current_user
  end
end
