class Document < ApplicationRecord
  belongs_to :booking

  has_attached_file :doc, styles: { medium: "800x800>", thumb: "100x100>" }
  validates_attachment_content_type :doc, content_type: /\Aimage\/.*\z/

end
