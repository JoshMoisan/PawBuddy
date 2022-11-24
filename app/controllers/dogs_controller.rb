class DogsController < ApplicationController
  # before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :authenticate_user!, only: [:show, :index]
  # before_action :set_dog, only: [:show, :edit, :update, :destroy, :new, :create]


  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    authorize(@dog)
  end

  def new
    if current_user
      @dog = Dog.new
      authorize(@dog)
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    authorize(@dog)
    if @dog.save
    # redirect to dog_path(@dog)
    redirect_to dog_path(@dog)
   else
    # render :new, status: :unprecessable_entity
   end
  end

  def edit
    @dog = Dog.find(params[:id])
    authorize(@dog)
  end

  def update
    @dog = Dog.find(params[:id])
    authorize(@dog)
    if @dog.update(dog_params)
      redirect_to @dog, notice: "Dog was successfully updated"
    else
      # render :edit, status :unprecessable_entity
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    authorize(@dog)
    @dog.destroy
    redirect_to root_path
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :description, :photo)
  end

end
