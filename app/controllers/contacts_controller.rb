class ContactsController < ApplicationController
  def new
    @address_book = AddressBook.find(params[:address_book_id])
    @contact = Contact.new
  end

  def create
    @address_book = AddressBook.find(params[:address_book_id])
    @user = @address_book.user
    @contact = Contact.create(contact_params)
    @contact.address_book = @address_book
    @contact.save
    respond_to do |format|
    format.html { redirect_to user_address_book_path(@user, @address_book)}
    format.js
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to :back
  end

private
  def contact_params
    params.require(:contact).permit(:firstName, :lastName, :number)
  end
end
