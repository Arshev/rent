class Photo < ApplicationRecord
  belongs_to :car

  has_attached_file :image, styles: { main: "340x200#", list: "470x300#", prices: "150x100>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
