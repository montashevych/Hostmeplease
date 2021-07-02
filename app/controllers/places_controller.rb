class PlacesController < ApplicationController
  respond_to :json, :html

  PLACES_PER_PAGE = 9

  before_action :place_find, only: [:show]

  def index
    @places = Place.where(status: :created).paginate(page: params[:page], per_page: PLACES_PER_PAGE)
  end

  def bookings
    @place = Place.find(params[:id])

    respond_with do |format|
      format.json { render json: @place.bookings.where(cancelled: false) }
    end
  end

  def show
    @place = Place.find(params[:id])

    respond_with do |format|
      format.html
      format.json { render json: @place }
    end
  end

  def new; end

  def edit; end

  def my_places
    @count_places = current_user.places.count
    @places = current_user.places.paginate(page: params[:page], per_page: PLACES_PER_PAGE)
  end

  private

  def place_find
    @place = Place.find(params[:place_id])
  end

  def book
    @place = Place.find(params[:place_id])
    @user  = current_user

    if booking_overlaps(params[:booking][:checkin], params[:booking][:checkout])
      show_overlap_flash
    else
      redirect_to_confirm
    end
  end

  def booking_params
    params.require(:booking).permit(:checkin, :checkout)
  end

  def booking_overlaps(checkin, checkout)
    overlapping = Booking
      .with_overlapping_dates(checkin, checkout)
      .where(place_id: @place.id, cancelled: false)

    overlapping.any?
  end

  def show_overlap_flash
    flash[:error] = "Another user has already booked #{@place.title} for that dates."
    redirect_to place_url(id: @place.id)
  end

  def redirect_to_confirm
    @booking = Booking.create(place: @place, user: @user, confirmed: false)
    @booking.update!(booking_params)
    @booking.save!

    redirect_to booking_confirm_url(id: @booking.id)
  end

  def place_params
    params.require(:place).permit(:title)
  end
end
