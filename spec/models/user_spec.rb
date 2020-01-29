require 'rails_helper'

RSpec.describe User, type: :model do
  it 'nameが空ならバリデーションが通らない' do
    user = User.new(name: '', email: '失敗テスト', password: '失敗テスト', password_confirmation: '失敗テスト')
    expect(user).not_to be_valid
  end

  it 'emailが空ならバリデーションが通らない' do
      user = User.new(name: '失敗テスト', email: '', password: '失敗テスト', password_confirmation: '失敗テスト')
    expect(user).not_to be_valid
  end

  it 'passwordが空ならバリデーションが通らない' do
    user = User.new(name: '失敗テスト', email: '失敗テスト', password: '', password_confirmation: '失敗テスト')
    expect(user).not_to be_valid
  end

  it 'password_confirmationが空ならバリデーションが通らない' do
    user = User.new(name: '失敗テスト', email: '失敗テスト', password: '失敗テスト', password_confirmation: '')
    expect(user).not_to be_valid
  end

end
