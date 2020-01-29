class User < ApplicationRecord
  before_validation { email.downcase! }
  before_destroy :must_not_destroy_last_one_admin

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true
  #なぜだ！？adminの以下の設定はNG！？
  # validates :admin, presence: true

  has_secure_password
  has_many :tasks, dependent: :destroy

  private

  def must_not_destroy_last_one_admin
    throw(:abort) if User.where(admin: true).count == 1
  end

end
