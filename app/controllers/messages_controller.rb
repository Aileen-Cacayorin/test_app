class MessagesController < ApplicationController
  def new
    @address_book = AddressBook.find(params[:address_book_id])
    @message = Message.new
    if params[:contact]
      @contact = Contact.find(params[:contact])
    end
  end

  def create
    if message_params[:contact_ids]
      @message = Message.new(:to => message_params[:to], :body => message_params[:body], :from => message_params[:from] )
      message_params[:contact_ids].each do |contact|
        new_message = Message.create(:to => contact, :body => @message.body, :from => @message.from )
        new_message.save
      end
      redirect_to user_path(current_user)

    else
    @message = Message.create(:to => message_params[:to], :body => message_params[:body], :from => message_params[:from] )
    @message.save
    redirect_to user_path(current_user)
    end
  end


  def message_params
    params.require(:message).permit(:to, :from, :body, :address_book_id, :contact_ids => [])
  end
end
