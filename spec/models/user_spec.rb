require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    @user1 = described_class.find_by(user: @user.email)
    expect(@user1).to be_valid?
  end

  it 'has a unique email' do
    user2 = build(:user, email: 'bob@gmail.com')
    expect(user2).not_to be_valid
  end

  it 'is not valid without a password' do
    user2 = build(:user, password: nil)
    expect(user2).not_to be_valid
  end

  it 'is not valid without an email' do
    user2 = build(:user, email: nil)
    expect(user2).not_to be_valid
  end
end
