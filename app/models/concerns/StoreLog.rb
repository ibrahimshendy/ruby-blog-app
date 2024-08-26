# frozen_string_literal: true

module StoreLog
  def log_article_created
    Log.create(
      event: 'article.created',
      description: self.title
    )
  end
end
