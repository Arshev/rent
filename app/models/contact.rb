class Contact < ApplicationRecord
    validates :email, presence: true
      validates :name, presence: true
end
