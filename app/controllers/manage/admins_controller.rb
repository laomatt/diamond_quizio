class Manage::AdminsController < Manage::BaseController
  def dashboard
  end
  def user_crud
    @users = User.all
  end

  def question_crud
    @questions = Question.all
  end

end
