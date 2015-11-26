class Manage::QuestionsController < Manage::BaseController
  before_filter :find_question, :except => [:index]

  def index
    @questions = Question.all.paginate(:page => params[:page], :per_page => 15)
  end

  def create

  end

  def disapprove
    @question.disapprove(params[:disapproval_reason], current_user)
    redirect_to '/manage/admins/question_crud'
  end

  def approve
    @question.approve
    redirect_to '/manage/admins/question_crud'
  end

  def new

  end

  def edit
  end

  def show
    @dummy_ans = [@question.dummy_answer1,@question.dummy_answer2,@question.dummy_answer3]
  end

  def update
    @question.update_attributes(question_params)
    redirect_to '/manage/admins/question_crud'
  end

  def trash
    @question.update_attributes(:status => "trashed by #{current_user.name}")
    redirect_to '/manage/admins/question_crud'
  end

  def destroy
    @question.delete
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question, :answer)
  end
end
