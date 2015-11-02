class Message < ActiveRecord::Base
  before_create :send_message
  has_and_belongs_to_many :contacts

  validates :body, :presence => true
  validates :to, :presence => true
  validates :from, :presence => true

  private

  def send_message
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.twilio.com/2010-04-01/Accounts/AC04c2fcb37cf493cc36bc7596eb3df0c3/Messages',
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => body,
                      :To => to,
                      :From => from}
      ).execute
      rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
