class UsersController < ApplicationController
  before_filter :authenticate_user!
  layout 'public'

  def font_page

  end
end
