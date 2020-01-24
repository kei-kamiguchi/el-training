class TasksController < ApplicationController

  def index
    if params[:sort_expired]=='limit'
      @tasks=current_user.tasks.all.limit_sort.page(params[:page])
      return
    end
    if params[:sort_expired]=='priority'
      @tasks=current_user.tasks.all.priority_sort.page(params[:page])
      return
    end
    if params.dig(:task, :title).present? && params.dig(:task, :status).present?
      @tasks=current_user.tasks.where("title LIKE ?", "%#{ params[:task][:title] }%").where(status: params[:task][:status]).page(params[:page])
    elsif params.dig(:task, :status).present?
      @tasks=current_user.tasks.where(status: params[:task][:status]).page(params[:page])
    elsif params.dig(:task, :title).present?
      @tasks=current_user.tasks.where(title: params[:task][:title]).page(params[:page])
    else
      @tasks=current_user.tasks.all.order(created_at: :asc).page(params[:page])
    end
  end

  def new
    @task=Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    # @task=current_user.tasks.build(task_params)
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
    params.require(:task).permit(:title, :content, :limit, :status, :priority)
  end
end
