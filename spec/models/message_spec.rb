require 'rails_helper'

describe Message do
  it { should belong_to :contact}
  it { should validate_presence_of :to }
  it { should validate_presence_of :body }
  it { should validate_presence_of :from }

end
