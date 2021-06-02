class PlacesController < ApplicationController
  PAGES = 9

  def index
    @places = Place.where(status: true).paginate(page: params[:page], per_page: PAGES)
  end

  def show
    @place = Place.find(params[:id])
  end
end
