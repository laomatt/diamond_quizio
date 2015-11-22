class Manage::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin
  layout 'public'

  protected

  def check_admin
    if !current_user.admin?
      redirect_to '/users/sign_in'
    end
  end
end
