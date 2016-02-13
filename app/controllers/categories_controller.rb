class CategoriesController < ApplicationController
  layout 'public', :except => [:public_show]
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_user!, :only => [:public_show]
  def index
  	@categories = Category.all
  end

  def create
    Category.create(category_params)
    redirect_to :back
  end

  def public_show
    @category = Category.find(params[:id])
    if current_user
      redirect_to "/categories/#{@category.id}/private_show"
    end
  end

  def private_show
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
    @ques = @category.questions.select{|e| e.accepted }.shuffle.first(10)
    @qlist = @ques.map { |e| e.id }.to_json
  end

  def tabulate_scores
  	@category = Category.find(params[:id])
    @ques = JSON.parse(params[:question_list])
    @score = QuizScore.create(:user_id => current_user.id, :category_id => @category.id)
    qs = []
    @ques.each do |f|
      qs << Question.find(f)
    end
    @score.update_attributes(:questions => qs.to_json)
    nums = [0,1,2,3,4,5,6,7,8,9]
    score = 0
    nums.each do |q|
      question = qs[q]
      if params['score']["ans#{q}"] == 'right'
        QuestionStat.create(:correct => true, :question_id => question.id, :user_id => current_user.id)
        score += 1
      else
        QuestionStat.create(:correct => false, :question_id => question.id, :user_id => current_user.id)
      end
    end
    @score.update_attributes(:score => score)

    redirect_to "/categories/#{@score.id}/score"
  end

  def score
    @score = QuizScore.find(params[:id])
    @user = @score.user
  end

  private

  def category_params
  	params.permit(:name,:image_url)
  end
end
