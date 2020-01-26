class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user=User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      log_in user
      if user.admin?
        redirect_to admin_users_path, notice: "ログインしました"
      else
        redirect_to tasks_path, notice: "ログインしました"
      end
    else
      flash.now[:notice] = "ログインできませんでした"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "ログアウトしました"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
