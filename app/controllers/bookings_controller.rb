class BookingsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_booking
  before_action :check_same_user

  def show
    respond_to do |format|
      format.html
      format.json { render json: @booking.to_json(include: :place) }
    end
  end

  def confirm; end

  def cancel
    @booking.cancelled = true
    @booking.save!
    flash[:success] = "Cancelled booking for #{@booking.place.title} successfully."
    redirect_to user_bookings_url(id: @booking.user.id)
  end

  def receipt
    respond_to do |format|
      format.pdf do
        render pdf: "#{@booking.id}-receipt",
               template: 'bookings/receipt.html.slim',
               page_size: 'A7',
               background: true
      end
    end
  end

  def save
    @booking.confirmed = true
    @booking.save!
    redirect_to user_bookings_url(@booking.user)
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def check_same_user
    return if current_user.id == @booking.user.id

    flash[:error] = 'You need to be the same user as the one who created the booking to view it.'
    redirect_to root_url
  end
end
