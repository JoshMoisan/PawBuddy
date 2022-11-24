class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if params[:query].present?
      sql_query = "name ILIKE :query OR breed ILIKE :query"
      @dogs = Dog.where(sql_query, query: "%#{params[:query]}%")
    else
      @dogs = Dog.all
    end
  end
end
