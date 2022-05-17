class PassengersController < ApplicationController
  before_action :set_passenger, only: %i[ show destroy ]

  # GET /passengers or /passengers.json
  def index
    @passengers = Passenger.all
  end

  # GET /passengers/1 or /passengers/1.json
  def show
  end

  # DELETE /passengers/1 or /passengers/1.json
  def destroy
    if @passenger.destroy
      redirect_to root_path, notice: "Ticket was refund"
    else
      redirect_to root_path, notice: @passenger.errors.messages.values
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def passenger_params
      params.fetch(:passenger, {})
    end
end
