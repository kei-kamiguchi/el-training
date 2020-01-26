class Admin::UsersController < ApplicationController
  before_action :admin_required

  def index
    @user=User.all
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      log_in @user
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を作成し、ログインしました"
    else
      render "new"
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザー「#{@user.name}」を更新しました"
    else
      render 'edit'
    end
  end

  def show
    @user=User.find(params[:id])
  end

  def destroy
    @user=User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path, notice: 'ユーザーを削除しました'
    else
      redirect_to admin_users_path, notice: 'ユーザーを削除できませんでした'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def admin_required
    redirect_to root_path, notice: '管理者以外アクセスできません' unless current_user.admin?
  end
end
