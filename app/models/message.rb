class Message < ActiveRecord::Base
  belongs_to :contact

  validates :body, :presence => true
  validates :to, :presence => true
  validates :from, :presence => true
end
