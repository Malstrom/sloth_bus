class Passenger < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validate :free_seats?, :payment_info?, :max_extra_luggage?
  before_destroy :enough_time_to_refund?

  def free_seats?
    if self.trip.passengers.count >= self.trip.seats
      errors.add(:no_seats, "Sorry, this trip already full")
    end
  end

  def payment_info?
    if self.user.credit_cards.empty?
      errors.add(:no_credit_card, "You must provide payment information before")
    end
  end

  def enough_time_to_refund?
    if DateTime.now > self.trip.departure_time - 30.minutes
      errors.add(:refund_time_expired, "Refund allow before 30 minutes from departure time")
      throw :abort
    end
  end

  def max_extra_luggage?
    if self.extra_luggage > 6
      errors.add(:refund_time_expired, "The bus is full of luggage")
    end
  end
end
