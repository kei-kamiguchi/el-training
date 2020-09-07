2.times do |n|
  User.create(name: "user#{n+1}", email: "user#{n+1}@sample.com", admin: true, password: "#{n+1}"*6, password_confirmation: "#{n+1}"*6)
end

5.times do |n|
  Label.create(name: "ラベル#{n+1}")
end

user=User.find(1)

30.times do |n|
  user.tasks.create!(title:"タスク#{n+1}", content:"タスク#{n+1}の詳細内容", limit:"2020-01-#{n+1} 15:00:00", status:'未着手', priority: "#{rand(0..2)}", label_ids: "#{rand(1..5)}")
end

user=User.find(2)

30.times do |n|
  user.tasks.create!(title:"タスク#{n+1}", content:"タスク#{n+1}の詳細内容", limit:"2020-01-#{n+1} 15:00:00", status:'未着手', priority: "#{rand(0..2)}", label_ids: "#{rand(1..5)}")
end
