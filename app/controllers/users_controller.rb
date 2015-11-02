class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @address_books = @user.address_books
  end
end
