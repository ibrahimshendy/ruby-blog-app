class Contact < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, length: { minimum: 5, maximum: 255}
  validates :phone, presence: true, length: { minimum: 5, maximum: 14 }
  validates :message, presence: true, length: { minimum: 10, maximum: 1000 }
end
