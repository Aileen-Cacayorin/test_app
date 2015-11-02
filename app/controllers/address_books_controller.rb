class AddressBooksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @address_book = AddressBook.new
  end

  def create
    @user = User.find(params[:user_id])
    @address_book = AddressBook.create(address_book_params)
    @address_book.user = @user
    @address_book.save
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:user_id])
    @address_book = AddressBook.find(params[:id])
    @contacts = @address_book.contacts
  end

private
  def address_book_params
    params.require(:address_book).permit(:name)
  end
end
