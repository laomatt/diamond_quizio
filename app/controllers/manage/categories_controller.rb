class Manage::CategoriesController < Manage::BaseController
  before_filter :find_category, :except => [:index]

  def index
    @cats = Category.all
  end

  def category

  end

  def update

  end

  private

  def find_category
    @category = Category.find(params[:id])

  end
end
