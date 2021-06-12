class PlacesController < ApplicationController
  PLACES_PER_PAGE = 9

  def index
    @places = Place.where(status: :created).paginate(page: params[:page], per_page: PLACES_PER_PAGE)
  end

  def show
    place_find
  end

  def myplaces
    @place = Place.where(user: current_user)
  end

  private

  def place_find
    @place = Place.find(params[:id])
  end
end
