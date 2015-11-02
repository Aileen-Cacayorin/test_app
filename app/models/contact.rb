class Contact < ActiveRecord::Base
  belongs_to :address_book
  has_and_belongs_to_many :messages


  validates :firstName, :presence => true
  validates :lastName, :presence => true
  validates :number, :presence => true

  def fullname
    return self.lastName + ", " + self.firstName
  end
end
