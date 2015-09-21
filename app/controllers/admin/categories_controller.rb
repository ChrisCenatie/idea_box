class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
  end

  def create
    Category.create(category: params[:category][:category])
    redirect_to admin_categories_path
  end

  def destroy
    Category.find(params[:id]).delete
    redirect_to admin_categories_path
  end
end
