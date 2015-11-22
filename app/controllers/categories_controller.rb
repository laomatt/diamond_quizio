class CategoriesController < ApplicationController
  layout 'public'
  skip_before_filter  :verify_authenticity_token
  def index
  	@categories = Category.all
  end

  def create
    Category.create(category_params)
    redirect_to :back
  end

  def show
  	@category = Category.find(params[:id])
  end

  private

  def category_params
  	params.permit(:name,:image_url)
  end
end
