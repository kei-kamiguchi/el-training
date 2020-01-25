require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before(:each) do
    current_user=FactoryBot.create(:user)
    FactoryBot.create(:task, user: current_user)
    FactoryBot.create(:second_task, user: current_user)
  end
  before do
    visit new_session_path
    fill_in 'メールアドレス', with: 'a@a.a'
    fill_in 'パスワード', with: 'Factoryで作ったデフォルトのパスワード１'
    click_on 'commit'
  end

  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
        expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル２'
        expect(page).to have_content 'Factoryで作ったデフォルトのコンテント２'
      end
    end

    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の新しい順に並んでいること'  do
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'Factoryで作ったデフォルトのタイトル２'
        expect(task_list[1]).to have_content 'Factoryで作ったデフォルトのタイトル１'
      end
    end

    context '「終了期限が遅い順」のボタンが押された場合' do
      it '終了期限が遅い順にタスクが表示されること' do
        click_on '終了期限でソートする'
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'Factoryで作ったデフォルトのタイトル２'
        expect(task_list[1]).to have_content 'Factoryで作ったデフォルトのタイトル１'
      end
    end

    context '「検索」のボタンが押された場合' do
      it '検索に入力した文字を含むタイトルで、選択したステータスと一致するタスクが表示されること' do
        fill_in 'task[title]', with: 'タイトル１'
        select '未着手', from: 'task_status'
        click_on '検索'
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
        expect(page).to have_content '未着手'
      end
    end
  end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        click_on '作成'
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
        click_link 'Factoryで作ったデフォルトのタイトル１'
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
        expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
      end
    end
  end
end
