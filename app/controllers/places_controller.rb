class PlacesController < ApplicationController
  PLACES_PER_PAGE = 9

  before_action :authenticate_user!, only: [:new, :create, :my_places, :destroy]
  before_action :place_find, only: [:show]

  def index
    @places = Place.where(status: :created).paginate(page: params[:page],
                                                     per_page: PLACES_PER_PAGE)
  end

  def show; end

  def new
    @place = Place.new
    @address = @place.build_address
    @pictures = @place.pictures.build
  end

  def create
    place_build

    if @place.save
      flash[:notice] = 'Place created'
      redirect_to place_path(@place)
    else
      flash[:error] = 'Incorrect data entry'
      render :new
    end
  end

  def edit; end

  def destroy; end

  def my_places
    @count_places = current_user.places.count
    @places = current_user.places.paginate(page: params[:page],
                                           per_page: PLACES_PER_PAGE)
  end

  private

  def place_find
    @my_place = Place.find(params[:id])
  end

  def place_build
    @place = current_user.places.build(place_params)
  end

  def place_params
    params.require(:place).permit(:title, :description, :price, :type, :lon,
                                  :lat, address_attributes: [:country,
                                                             :state_region,
                                                             :city,
                                                             :details],
                                        pictures_attributes: [:image])
  end
end
