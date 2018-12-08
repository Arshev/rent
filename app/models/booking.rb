class Booking < ApplicationRecord

  include ActionView::Helpers::AssetUrlHelper

  # before_validation :parse_image
  # attr_accessor :image_base

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_attached_file :prava, styles: { medium: "300x300>" }
  validates_attachment_content_type :prava, content_type: /\Aimage\/.*\z/

  # has_many_attached :documents

  default_scope {order('created_at DESC')}

  def picture_url
    "http://amigorent.ru" + self.picture.url
  end

  def prava_url
    "http://amigorent.ru" + self.prava.url
  end

  def cover_avatar(size)
    if self.avatar
      self.avatar.url(size)
    else
      "blank.jpg"
    end
  end

  def cover_prava(size)
    if self.prava
      self.prava.url(size)
    else
      "blank.jpg"
    end
  end

  def send_sms
    message = MainsmsApi::Message.new(message: "#{self.firstname} авто: #{self.car} тел: #{self.phone} с #{self.start_date} до #{self.end_date}", recipients: ['79217101615'])
    response = message.deliver
  end

  private
    def parse_image
      image = Paperclip.io_adapters.for(image_base)
      image.original_filename = "file.jpg"
      self.picture = image
    end
end
