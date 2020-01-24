require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :model do

  it 'titleが空ならバリデーションが通らない' do
    task = Task.new(title: '', content: '失敗テスト', limit: '{1i: "2023", 2i: "3", 3i: "5", 4i: "03", 5i: "02"}', status: '未着手', priority: 1)
    expect(task).not_to be_valid
  end

  it 'contentが空ならバリデーションが通らない' do
    # ここに内容を記載する
    task = Task.new(title: '失敗テスト', content: '', limit: '{1i: "2023", 2i: "3", 3i: "5", 4i: "03", 5i: "02"}', status: '未着手', priority: 1)
    expect(task).not_to be_valid
  end

  it 'limitが空ならバリデーションが通らない' do
    # ここに内容を記載する
    task = Task.new(title: '失敗テスト', content: '失敗テスト', limit: '', status: '未着手', priority: 1)
    expect(task).not_to be_valid
  end

  it 'statusが空ならバリデーションが通らない' do
    task = Task.new(title: '失敗テスト', content: '失敗テスト', limit: '{1i: "2023", 2i: "3", 3i: "5", 4i: "03", 5i: "02"}', status: '', priority: 1)
    expect(task).not_to be_valid
  end

  it 'priorityが空ならバリデーションが通らない' do
    # ここに内容を記載する
    task = Task.new(title: '失敗テスト', content: '失敗テスト', limit: '{1i: "2023", 2i: "3", 3i: "5", 4i: "03", 5i: "02"}', status: '未着手', priority: '')
    expect(task).not_to be_valid
  end

  it 'titleとcontentに内容が記載されていればバリデーションが通る' do
    # ここに内容を記載する
    task = Task.new(title: '失敗テスト', content: '失敗テスト', limit: '{1i: "2023", 2i: "3", 3i: "5", 4i: "03", 5i: "02"}', status: '未着手', priority: 1)
    expect(task).to be_valid
  end

end