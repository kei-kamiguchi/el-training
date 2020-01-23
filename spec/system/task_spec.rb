require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before(:each) do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
        visit tasks_path
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
        expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル２'
        expect(page).to have_content 'Factoryで作ったデフォルトのコンテント２'
      end
    end

    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の降順に並んでいること'  do
        new_task = FactoryBot.create(:task, title: 'new_task')
        visit tasks_path
        task_list = all('.task_row') # タスク一覧を配列として取得するため、View側でidを振っておく
        expect(task_list[0]).to have_content 'Factoryで作ったデフォルトのタイトル１'
        expect(task_list[1]).to have_content 'Factoryで作ったデフォルトのタイトル２'
        expect(task_list[2]).to have_content 'new_task'
      end
    end
  end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit new_task_path(@task)
        fill_in 'task[title]', with: 'タイトル'
        fill_in 'task[content]', with: '詳細'
        click_on '登録'
        expect(page).to have_content 'タイトル'
        expect(page).to have_content '詳細'
      end
    end
  end

  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示されたページに遷移すること' do
         task=FactoryBot.create(:task, title: 'task')
         visit task_path(task)
         expect(page).to have_content 'task'
       end
     end
  end
end
