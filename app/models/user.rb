class User < ApplicationRecord
  has_many      :credit_cards

  has_many      :passengers
  has_many      :trips, through: :passengers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
