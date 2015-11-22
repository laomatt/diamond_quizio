class UsersController < ApplicationController
  # before_filter :authenticate_user!, :except => %w(front_page)
  layout 'public'

  def font_page

  end

  def show
    :authenticate_user!
  end
end
