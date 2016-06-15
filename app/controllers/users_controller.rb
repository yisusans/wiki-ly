class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    # @groups = @user.groups.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
