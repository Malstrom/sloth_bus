class Trip < ApplicationRecord

  # models/concerns/filterable.rb
  include Filterable

  belongs_to :departure, class_name: 'Location'
  belongs_to :arrival, class_name: 'Location'

  has_many :passengers
  has_many :users, through: :passengers

  # call this method in controller to filter trips
  scope :not_departed,             -> { where("departure_time >= ? ", DateTime.now) }
  scope :filter_by_departure,      -> (departure)       { where departure: departure }
  scope :filter_by_arrival,        -> (arrival)         { where arrival: arrival }
  scope :filter_by_departure_time, -> (departure_time)  { where("departure_time >= ? ", departure_time) }
end
