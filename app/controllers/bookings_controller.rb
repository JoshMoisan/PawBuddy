class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new create]
  skip_after_action :verify_policy_scoped, only: :index
  before_action :set_dog, only: %i[new create show]
  before_action :set_booking, only: %i[create show edit update]

  def index
    @bookings = Booking.where(user: current_user)
    @dogs = Dog.all
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    @booking.dog = Dog.find(params[:dog_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to dog_path(@dog)
    end
  end

  def edit
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
