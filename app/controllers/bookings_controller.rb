class BookingsController < ApplicationController
  before_action :set_list, only: [:create, :show, :edit, :update]

  def new
    @booking = Booking.new
  end


  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to user_show_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Bookig.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to user_show_path(current_user)
    else
      render :update, status: :unprocessable_entity
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
