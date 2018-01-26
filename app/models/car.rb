class Car < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :car_name, presence: true
  validates :year, presence: true
  validates :color, presence: true
  validates :transmission, presence: true
  validates :engine_capacity, presence: true
  validates :is_electropackage, presence: true
  validates :car_class, presence: true
  validates :car_type, presence: true

end
