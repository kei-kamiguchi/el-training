class TasksController < ApplicationController
  def index
    if params[:sort_expired]=='limit'
      @tasks=Task.all.order(limit: :desc)
      return
    end
    if params.dig(:task, :title).present?
      @tasks=Task.where("title LIKE ?", "%#{ params[:task][:title] }%").where(status: params[:task][:status])
    elsif params.dig(:task, :status).present?
      @tasks=Task.where(status: params[:task][:status])
    else
      @tasks=Task.all.order(created_at: :asc)
    end
  end
  # params.dig(:task, :title).present? && params.dig(:task, :status).present?
  #   @task=Task.where("title LIKE ?", "%#{ params[:task][:title] }%").where(status: params[:task][:status])
  # elsif

  def new
    @task=Task.new
  end

  def create
    @task=Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'タスクを作成しました'
    else
      render :new
    end
  end

  def edit
    @task=Task.find(params[:id])
  end

  def update
    @task=Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notyice: 'タスクを更新しました'
    else
      render :edit
    end
  end

  def show
    @task=Task.find(params[:id])
  end

  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'タスクを削除しました'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :limit, :status)
  end
end
