class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
