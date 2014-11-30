class EventsController < ApplicationController
  def index
    @events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Event Successfully Updated! :)"
      redirect_to @event
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event Successfully Created! :)"
      redirect_to @event
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :starts_at, :capacity, :image_file_name)
  end
end
