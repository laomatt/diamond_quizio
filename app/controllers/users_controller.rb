class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:sign_in]
  before_filter :find_user, :except => [:front_page, :me, :sign_in]
  layout 'public', :except => [:front_page, :sign_in]

  def front_page
    if current_user
      redirect_to "/user_info/me"
    end
  end

  def sign_in

  end

  def show
    @questions = @user.questions
  end

  def me
    @user = current_user
    @questions = @user.questions
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
