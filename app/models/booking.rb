class Booking < ApplicationRecord
  has_many :documents, dependent: :destroy

  def cover_photo(size)
    if self.documents.length > 0
      self.documents[0].doc.url(size)
    else
      "blank.jpg"
    end
  end
end
