class HomeController < ApplicationController
  def index
    @articles = Article.take(5)
  end
end
