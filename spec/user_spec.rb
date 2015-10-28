require 'rails_helper'

describe User do

  it 'user only added if has unique email' do
    user = User.create(email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
    user2 = User.new(email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
    expect(user2).not_to be_valid
  end
end
