class PlacesController < ApplicationController
  PLACES_PER_PAGE = 9

  before_action :place_find, only: [:show]

  def index
    @places = Place.where(status: :created).paginate(page: params[:page], per_page: PLACES_PER_PAGE)
  end

  def show; end

  def new; end

  def edit; end

  def my_places
    @count_places = current_user.places.count
    @places = current_user.places.paginate(page: params[:page], per_page: PLACES_PER_PAGE)
  end

  private

  def place_find
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:title)
  end
end
