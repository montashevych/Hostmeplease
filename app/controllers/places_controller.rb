class PlacesController < ApplicationController
  def index
    @places = Place.paginate(page: params[:page], per_page: 9)
  end
end
