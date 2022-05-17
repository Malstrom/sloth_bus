class PassengersController < ApplicationController
  before_action :set_passenger, only: %i[ show add_extra_luggage destroy ]

  before_action :verify_if_admin, only: %i[ index ]
  before_action :authenticate_user!, :only => [:index]

  # GET /passengers or /passengers.json
  def index
    @total_revenue_by_departure = Trip.total_revenue_by_departure
    @total_revenue = Passenger.sum :price
  end

  # GET /passengers/1 or /passengers/1.json
  def show
  end

  def add_extra_luggage
    @passenger.extra_luggage += params[:extra_luggage].to_i if params[:extra_luggage].try(:to_i).is_a? Integer
    @passenger.price += 5.00

    if @passenger.save
      redirect_to user_passenger_path(current_user, @passenger), notice: "Extra luggage add to your trip"
    else
      redirect_to user_passenger_path(current_user, @passenger), notice: @passenger.errors.messages.values
    end
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

    # todo: use pundit for authorization
    def verify_if_admin
      redirect_to root_path, notice: "you are no able to see this page" unless current_user.admin?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def passenger_params
      params.require(:passenger).permit(:extra_luggage)
    end
end
