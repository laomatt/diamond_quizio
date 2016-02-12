class Manage::AdminsController < Manage::BaseController
  def dashboard
  end
  def user_crud
    @users = User.all.paginate(:page => params[:page], :per_page => 15)
  end

  def question_crud
    @questions = Question.where(:accepted => false).paginate(:page => params[:page], :per_page => 15)
  end

  def categories_crud

  end

end
