class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy
#以下追加
  has_many :tasks, through: :labelings
end
