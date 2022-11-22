class DogsController < ApplicationController
  # before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :authenticate_user!, only: [:show, :index]
  # before_action :set_dog, only: [:show, :edit, :update, :destroy, :new, :create]


  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    if current_user
      @dog = Dog.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
    # redirect to dog_path(@dog)
    redirect_to dog_path(@dog)
   else
    # render :new, status: :unprecessable_entity
   end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
  end

  def destroy
    @dog.destroy
    redirect to users_show_path(current_user)
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :description)
  end

end
