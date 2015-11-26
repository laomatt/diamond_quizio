class CategoriesController < ApplicationController
  layout 'public'
  skip_before_filter :verify_authenticity_token
  def index
  	@categories = Category.all
  end

  def create
    Category.create(category_params)
    redirect_to :back
  end

  def show
    @category = Category.find(params[:id])
    @ques = @category.questions.select{|e| e.accepted }.shuffle.first(10)
    @qlist = @ques.map { |e| e.id }.to_json
  end

  def tabulate_scores
  	@category = Category.find(params[:id])
    @ques = JSON.parse(params[:question_list])
    @score = QuizScore.create(:user_id => current_user, :category_id => @category.id)
    qs = []
    @ques.each do |f|
      qs << Question.find(f)
    end
    @score.update_attributes(:questions => qs.to_json)
    nums = [0,1,2,3,4,5,6,7,8,9]
    score = nums.map { |e| params['score']["ans#{e}"] == 'right' }.count{|e| e == true}
    @score.update_attributes(:score => score)

    redirect_to "/categories/#{@score.id}/score"
  end

  def score
    @score = QuizScore.find(params[:id])
  end

  private

  def category_params
  	params.permit(:name,:image_url)
  end
end
