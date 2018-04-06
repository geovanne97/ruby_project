class Site::HomeController < ApplicationController
  layout "site"

  def index
    @categories = Category.order_by_description#if i want so order in decrescente order i use description: :desc
    @ads = Ad.last_six  #he will call the scope in ad 
  end
end
