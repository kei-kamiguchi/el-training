# 「FactoryBotを使用します」という記述
FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    title { 'Factoryで作ったデフォルトのタイトル１' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
    limit { '{1i: "2023", 2i: "3", 3i: "5", 4i: "03", 5i: "02"}' }
    status { '未着手' }
    priority { 1 }
  end

  factory :second_task, class: Task do
    title { 'Factoryで作ったデフォルトのタイトル２' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
    limit { '{1i: "2030", 2i: "3", 3i: "5", 4i: "03", 5i: "02"}' }
    status { '未着手' }
    priority { 1 }
  end
end
