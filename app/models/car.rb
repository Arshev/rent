class Car < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations

  validates :car_name, presence: true
  validates :year, presence: true
  validates :color, presence: true
  validates :transmission, presence: true
  validates :engine_capacity, presence: true
  validates :car_class, presence: true
  validates :car_type, presence: true

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end

end
