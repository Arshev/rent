class Car < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :reservations, dependent: :destroy
  default_scope {order('sort')}

  

  def cover_photo(size)
    if self.photos.where(main_photo: true).length > 0
      self.photos.where(main_photo: true)[0].image.url(size)
      # self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end

end
