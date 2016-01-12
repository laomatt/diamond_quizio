class Manage::QuestionsController < Manage::BaseController
  before_filter :find_question, :except => [:index, :filter]

  def index
    @questions = Question.all.paginate(:page => params[:page] || 1, :per_page => 15)
  end

  def create

  end

  def filter
    @questions = Question.search_question(params)
    @questions = @questions.paginate(:page => params[:page] || 1, :per_page => 15)
    if params[:from] == "question_crud"
      render '/manage/admins/question_crud'
    else
      render :index
    end
  end

  def disapprove
    @question.disapprove(params[:disapproval_reason], current_user)
    flash[:notice] = "#{@question.id} was disapproved"
    redirect_to '/manage/admins/question_crud'
  end

  def approve
    @question.approve
    flash[:notice] = "#{@question.id} was approved"
    @question.update_attributes(:status => "approved by #{current_user.name}")
    redirect_to '/manage/admins/question_crud'
  end

  def new

  end

  def edit
    if params[:type] == 'assign'
      @question.update_attributes(:category_id => params[:new_cat])
      redirect_to :back
    end
  end

  def show
    @dummy_ans = [@question.dummy_answer1,@question.dummy_answer2,@question.dummy_answer3]
  end

  def update
    @question.update_attributes(question_params)
    redirect_to :back
  end

  def trash
    @question.trash
    @question.update_attributes(:status => "trashed by #{current_user.name}")
    flash[:notice] = "#{@question.id} was trashed"
    redirect_to '/manage/admins/question_crud'
  end

  def destroy
    byebug
    @question.delete
    redirect_to :back
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question, :answer)
  end
end
