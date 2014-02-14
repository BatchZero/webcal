class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  def show
    @events = @calendar.events
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)

    if @calendar.save
      redirect_to @calendar, notice: 'Calendar was successfully created'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @calendar.update(calendar_params)
      redirect_to @calendar, notice: 'Calendar was successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @calendar.destroy
    redirect_to calendars_url, notice: 'Calendar was successfully removed'
  end

    private

    def set_calendar
      @calendar = Calendar.find_by_token(params[:write_token])
    end

    def calendar_params
      params.require(:calendar).permit(:title, :description)
    end
end
