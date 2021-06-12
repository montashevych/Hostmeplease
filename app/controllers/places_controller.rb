class PlacesController < ApplicationController
  PLACES_PER_PAGE = 9

  def index
    @places = Place.where(status: :created).paginate(page: params[:page],
                                                     per_page: PLACES_PER_PAGE)
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:info] = "Place created."
      redirect_to root_url
    else
      render :new
    end
  end

  private
    def place_params
      params.require(:place).permit(:title, :description, :price)
    end
end
