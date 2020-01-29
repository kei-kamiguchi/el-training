User.create(name:'test', email:'test@test.test', admin: true, password: '1234', password_confirmation: '1234')
Label.create(name:'テスト')
user=User.find(1)
100.times do |n|
  user.tasks.create!(title:"テスト", content:"テスト", limit:"2020-01-28 15:00:00", status:'未着手', priority:1, label_ids:1)
end
