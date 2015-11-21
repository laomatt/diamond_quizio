class Manage::QuestionsController < Manage::BaseController
  before_filter :find_question, :except => [:index]

  def index

  end

  def create

  end

  def approve
    @question.approve

    render :json => @question
  end

  def new

  end

  def edit
  end

  def show

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
