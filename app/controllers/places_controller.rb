class PlacesController < ApplicationController
  def index; end

  def create; end

  def show
    @place = Place.find(params[:id])
  end

  def update; end

  def destroy; end
end
