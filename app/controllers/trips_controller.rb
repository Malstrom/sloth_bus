class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show book ]

  # GET /trips or /trips.json
  def index
    @trips = Trip.where(nil)

    # models/concerns/filterable.rb
    filtering_params(params).each do |key, value|
      @trips = @trips.public_send("filter_by_#{key}", value) if value.present?
    end
  end

  # GET /trips/1 or /trips/1.json
  def show
  end

  private

    # A list of the param names that can be used for filtering the Product list
    def filtering_params(params)
      params.slice(:departure, :arrival, :departure_time)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def trip_params
    #   params.fetch(:trip, {})
    # end
end
