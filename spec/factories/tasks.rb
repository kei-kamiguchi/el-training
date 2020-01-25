FactoryBot.define do
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
