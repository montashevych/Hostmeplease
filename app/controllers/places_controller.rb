class PlacesController < ApplicationController
  PLACES_PER_PAGE = 9

  def index
    @places = Place.where(status: :created).paginate(page: params[:page], per_page: PLACES_PER_PAGE)
  end

  def show
    @place = Place.find(params[:id])
  end

  def new

  end
end
