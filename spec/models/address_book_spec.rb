require 'rails_helper'

describe AddressBook do
  it { should belong_to :user}
  it { should have_many :contacts }
  it { should validate_presence_of :name }
end
