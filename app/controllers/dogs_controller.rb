class DogsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]


  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect to users_show_path(current_user)
   else
    render :new, status: :unprecessable_entity
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
