class Site::HomeController < SiteController

  def index
    @categories = Category.order_by_description#if i want so order in decrescente order i use description: :desc
    @ads = Ad.descending_order(6)  #he will call the scope in ad
  end
end
