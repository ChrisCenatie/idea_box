class IdeasController < ApplicationController
  before_action :current_user?

  def destroy
    Idea.find(params[:id]).delete
    redirect_to ideas_path
  end

  def index
    @ideas = Idea.where(user_id: current_user.id)
  end

  def new
    @categories = Category.all
  end

  def create
    Category.find(category_id).ideas << Idea.create(idea: user_idea,
                                              user_id: current_user.id)
    redirect_to ideas_path
  end

  private

  def category_id
    params[:idea][:category_id]
  end

  def user_idea
    params[:idea][:idea]
  end
end
