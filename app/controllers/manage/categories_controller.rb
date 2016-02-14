class Manage::CategoriesController < Manage::BaseController
  before_filter :find_category, :except => [:index]
  skip_before_filter :verify_authenticity_token
  def index
    @cats = Category.all
  end

  def category

  end

  def show
    if( @category.rankings != "null") && ( !@category.rankings.nil? )
      @ranks = JSON.parse(@category.rankings)
    else
      @ranks = {:a => 'a', :b => 'b', :c => 'c', :d => 'd', :f => 'f'}
    end
  end

  def update
    @category.update_attributes(category_edit_params)
    ranks = params[:rankings].to_json
    @category.update_attributes(:rankings => ranks)

    flash[:notice] = "Attr updated"
    redirect_to :back
  end

  private

  def category_edit_params
    params.require(:edit).permit(:name, :image_url)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
