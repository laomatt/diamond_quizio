class Manage::QuestionsController < Manage::BaseController
  before_filter :find_question, :except => [:index]

  def index

  end

  def create

  end

  def disapprove
    @question.disapprove(params[:disapproval_reason])
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
