class Comment < ApplicationRecord
  belongs_to :article

  STATUSES = %w[published archived]

  validates :comment, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: STATUSES }

  def archived?
    status == "archived"
  end

  def published
    status == "published"
  end
end
