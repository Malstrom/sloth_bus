class Trip < ApplicationRecord
  belongs_to :departure, class_name: 'Location'
  belongs_to :arrival, class_name: 'Location'

  has_many :passengers
  has_many :users, through: :passengers
end
