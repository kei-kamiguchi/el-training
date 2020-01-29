require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do
  before(:each) do
    current_user=FactoryBot.create(:second_user)
  end
  before do
    visit new_session_path
    fill_in 'メールアドレス', with: 'b@b.b'
    fill_in 'パスワード', with: 'Factoryで作ったデフォルトのパスワード2'
    click_on 'commit'
  end

  describe 'ユーザー一覧画面' do
    context 'ユーザーを削除した場合' do
      it 'ユーザーを削除しようとしても管理ユーザは1人もいなくならない' do
        click_on '削除'
        expect(page).to have_content 'Factoryで作ったデフォルトの名前2'
      end
    end
  end
end
