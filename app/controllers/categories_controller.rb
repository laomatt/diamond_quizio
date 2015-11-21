class CategoriesController < ApplicationController
  layout 'public'

  def index
  	@categories = Category.all
  end

  def create
    Category.create(category_params)

  end

  def show
  	@category = Category.find(params[:id])
  end

  private

  def category_params
  	params.require(:category).permit(:name,:image_url)
  end
end
