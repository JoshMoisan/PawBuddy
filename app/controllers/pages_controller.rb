class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if params[:query].present?
      sql_query = "name ILIKE :query OR breed ILIKE :query"
      @dogs = Dog.where(sql_query, query: "%#{params[:query]}%")
    else
      @dogs = Dog.all
    end
    @markers = @dogs.geocoded.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        info_window: render_to_string(partial: "dogs/info_window", locals: {dog: dog})
      }
    end
  end
end
