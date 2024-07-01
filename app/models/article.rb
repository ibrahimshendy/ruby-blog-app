class Article < ApplicationRecord
  has_many :comments, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
