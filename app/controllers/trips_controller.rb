class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show book ]

  # GET /trips or /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1 or /trips/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def trip_params
    #   params.fetch(:trip, {})
    # end
end
