class UsersController < ApplicationController
  def index
    @user = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  private
  def user_params
  end

  def correct_user
  end

end
