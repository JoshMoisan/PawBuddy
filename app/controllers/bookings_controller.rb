class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new create update]
  skip_after_action :verify_policy_scoped, only: :index
  before_action :set_dog, only: %i[new create show]

  def index
    @bookings = Booking.where(user: current_user)
    @dogs = Dog.all
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.dog = @dog
    @booking.status = "Pending 🌕"
    if @booking.save
      redirect_to user_path(current_user)
    else
      redirect_to dog_path(@dog)
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(status: params[:status])
      redirect_to user_path(current_user)
    else
      redirect_to dog_path(@dog)
    end
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
