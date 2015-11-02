class AddressBook < ActiveRecord::Base
  belongs_to :user
  has_many :contacts

  validates :name, :presence => true
end
