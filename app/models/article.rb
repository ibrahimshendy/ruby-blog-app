class Article < ApplicationRecord
  include StoreLog

  after_create :log_article_created

  has_many :comments, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  scope :latest, -> { order(created_at: :desc).limit(10) }
end
