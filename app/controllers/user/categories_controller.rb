class User::CategoriesController < User::BaseController
  def index
    @categories = Category.all
  end
end
