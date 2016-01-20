class UsersController < ApplicationController
  before_filter :authenticate_user!, :find_user, :except => [:front_page]
  layout 'public', :except => :front_page

  def front_page
    if current_user
      redirect_to "/users/show"
    end
  end

  def show
    @questions = @user.questions
  end

  private
  def find_user
    @user = current_user
  end
end
