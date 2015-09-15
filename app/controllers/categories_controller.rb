class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category added.'
      redirect_to '/categories'
    else
      render :new
    end
  end

  protected
  def category_params
    params.require(:category).permit(:name)
  end
end
