class PlacesController < ApplicationController
  PLACES_PER_PAGE = 9

  before_action :logged_in_user, only: [:new, :create]

  def index
    @places = Place.where(status: :created).paginate(page: params[:page],
                                                     per_page: PLACES_PER_PAGE)
  end

  def show
    place_find
  end

  def new
    @place = Place.new
    @address = Address.new
    @picture = Picture.new
  end

  def create
    @place = current_user.places.build(place_params.except(:address, :picture))
    @address = @place.build_address(place_params.require(:address))
    @picture = @place.pictures.build(place_params.require(:picture))
    if @place.save
      @address.save
      @picture.save
      flash[:success] = 'Place created'
      redirect_to places_path
    else
      # byebug
      render :new
    end
  end

  private

  def place_find
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:title,
                                  :description,
                                  :price,
                                  :type,
                                  address: [:country,
                                            :state_region,
                                            :city,
                                            :details],
                                  picture: [:image_cache, { image: [] }])
  end
end
