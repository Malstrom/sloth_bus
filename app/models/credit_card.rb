class CreditCard < ApplicationRecord
  belongs_to :user

  validates_presence_of :cardholder, :number, :cvv, :expire_date
end
