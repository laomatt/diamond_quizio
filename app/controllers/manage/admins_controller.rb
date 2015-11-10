class Manage::AdminsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin
  layout 'admin'

  def dashboard
  end


  def user_crud
    @users = User.all

  end

  def question_crud
    @questions = Question.all

  end

  private

  def check_admin
    if !current_user.admin?
      redirect_to '/users/sign_in'
    end
  end
end
