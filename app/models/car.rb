class Car < ApplicationRecord
  belongs_to :user

  validates :car_name, presence: true
  validates :year, presence: true
  validates :color, presence: true
  validates :transmission, presence: true
  validates :is_air, presence: true
  validates :engine_capacity, presence: true
  validates :is_electropackage, presence: true
  validates :car_class, presence: true
  validates :car_type, presence: true
  validates :price_1, presence: true
  validates :price_2, presence: true
  validates :price_3, presence: true
  validates :price_4, presence: true
  validates :price_main, presence: true
  validates :deposit, presence: true
end
