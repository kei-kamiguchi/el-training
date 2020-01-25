FactoryBot.define do
  factory :user do
    name { 'Factoryで作ったデフォルトの名前１' }
    email { 'a@a.a' }
    password { 'Factoryで作ったデフォルトのパスワード１' }
    password_confirmation { 'Factoryで作ったデフォルトのパスワード１' }
  end
end
