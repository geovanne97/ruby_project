class Backoffice::CategoriesController::CategoryService
#this show the principal variable used in the class
  attr_accessor :category

#this method create a new category, he takes the category params and valid this informations
#the function can return the new category or the erros
  def self.create(params_category)
    @category = Category.new(params_category)

    if @category.valid?
      @category.save!
    end
    @category
  end
end
