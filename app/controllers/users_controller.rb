class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      log_in @user
      redirect_to tasks_path, notice: "ユーザー「#{@user.name}」を作成し、ログインしました"
    else
      render "new"
    end
  end

  def show
    @user=User.find(params[:id])
    unless current_user == @user
      redirect_to tasks_path, notice: 'アクセスできませんでした'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

end
