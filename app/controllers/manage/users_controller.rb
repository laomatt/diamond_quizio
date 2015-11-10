class Manage::UsersController < Manage::BaseController
  before_filter :find_user

  def index

  end

  def create

  end

  def new

  end

  def edit
  end

  def show

  end

  def update
    @user.update_attributes(user_params)

  end

  def destroy
    @user.delete
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :admin, :email)
  end
end
