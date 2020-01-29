FactoryBot.define do
  factory :user do
    name { 'Factoryで作ったデフォルトの名前１' }
    email { 'a@a.a' }
    password { 'Factoryで作ったデフォルトのパスワード１' }
    password_confirmation { 'Factoryで作ったデフォルトのパスワード１' }
  end

  factory :second_user, class: User do
    name { 'Factoryで作ったデフォルトの名前2' }
    email { 'b@b.b' }
    admin { 'true' }
    password { 'Factoryで作ったデフォルトのパスワード2' }
    password_confirmation { 'Factoryで作ったデフォルトのパスワード2' }
  end
end
