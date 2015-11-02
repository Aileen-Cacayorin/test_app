require 'rails_helper'

describe Contact do
  it { should belong_to :address_book }
  it { should have_many :messages }
  it { should validate_presence_of :firstName }
  it { should validate_presence_of :lastName }
  it { should validate_presence_of :number }
end
