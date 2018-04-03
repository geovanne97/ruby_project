class Site::HomeController < ApplicationController
  layout "site"

  def index
    @categories = Category.order(:description)#if i want so order in decrescente order i use description: :desc
    @ads = Ad.limit(5).order(created_at: :desc)#he will list the anounce 5 by 5 and in desc order 
  end
end
