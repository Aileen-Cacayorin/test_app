require 'rails_helper'

describe Message do
  it { should have_and_belong_to_many :contacts}
  it { should validate_presence_of :to }
  it { should validate_presence_of :body }
  it { should validate_presence_of :from }

end
