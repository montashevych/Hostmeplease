class PlacesController < ApplicationController
  PLACES_PER_PAGE = 9

  before_action :authenticate_user!, only: [:new, :create, :my_places, :destroy]
  before_action :place_find, only: [:show]

  def index
    @places = Place.where(status: :created).paginate(page: params[:page],
                                                     per_page: PLACES_PER_PAGE)
  end

  def show
  end

  def new
    @place = Place.new
    @address = Address.new
    @picture = Picture.new
  end

  def create
    place_build && address_build && picture_build
    if @place.save && @address.save && @picture.save
      flash[:notice] = 'Place created'
      redirect_to place_path(@place)
    else
      flash[:error] = 'Incorrect data entry'
      render :new
    end
  end

  def edit; end

  def destroy
    consumer_to_owner_and_vice_versa
  end

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
    @place = current_user.places.build(place_params.except(:address, :picture))
  end

  def picture_build
    @picture = @place.pictures.build(place_params.require(:picture))
  end

  def address_build
    @address = @place.build_address(place_params.require(:address))
  end

  def place_params
    params.require(:place).permit(:title, :description, :price, :type, :lon,
                                  :lat, address: [:country,
                                                  :state_region,
                                                  :city,
                                                  :details],
                                        picture: [:image_cache, { image: [] }])
  end
end
