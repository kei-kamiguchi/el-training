class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :limit, presence: true
  validates :status, presence: true
  validates :priority, presence: true

  belongs_to :user

  scope :limit_sort, -> { order(limit: :desc) }
  scope :priority_sort, -> { order(priority: :desc) }
  #モデル側でパラメータは受け取れない？
  # scope :search_by_status, -> { where(status: params[:task][:status]) }
  # scope :search_by_title, -> { where("title LIKE ?", "%#{ params[:task][:title] }%") }
end
