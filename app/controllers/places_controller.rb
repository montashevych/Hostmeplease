class PlacesController < ApplicationController
  def index
    @places = Place.where("active = ?", true).paginate(page: params[:page], per_page: 9)
  end
end
