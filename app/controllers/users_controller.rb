class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Application!"
      redirect_to @user
    else
      render 'new'
    end
  end

    private

  def user_params # The user_parama will only be used internally by the users controller, therefore placed under private
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
end