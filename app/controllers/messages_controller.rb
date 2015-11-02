class MessagesController < ApplicationController
  def new
    @address_book = AddressBook.find(params[:address_book_id])
    @message = Message.new
  end

  def create
    @message = Message.create(:to => message_params[:to], :body => message_params[:body], :from => message_params[:from] )
    @message.save
    redirect_to user_path(current_user)
  end


  def message_params
    params.require(:message).permit(:to, :from, :body, :address_book_id)
  end
end
