class RegistrationsController < ApplicationController
  before_action :fetch_event

  def index
    @registrations = @event.registrations
  end

  def new
    @registration = @event.registrations.new
  end

  def create
    @registration = @event.registrations.new(registration_params)
    if @registration.save
      redirect_to event_registrations_path(@event), notice: "Thanks for Registering. We will see you there!"
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:name, :email)
  end

  def fetch_event
    @event = Event.find(params[:event_id])
  end
end
