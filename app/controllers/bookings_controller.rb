class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dogs = @dogs
    if @booking.save
      redirect_to
  end

  def edit
  end

  def update
  end
end
