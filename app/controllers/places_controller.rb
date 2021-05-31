class PlacesController < ApplicationController
  def index
    @places = Place.where(status: true).paginate(page: params[:page], per_page: 9)
  end
end
