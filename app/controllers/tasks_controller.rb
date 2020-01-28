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
    @tasks=current_user.tasks.all.order(created_at: :desc).page(params[:page])
    if params.dig(:task, :title).present?
      @tasks=@tasks.where("title LIKE ?", "%#{ params[:task][:title] }%").page(params[:page])
    end
    if params.dig(:task, :status).present?
      @tasks=@tasks.where(status: params[:task][:status]).page(params[:page])
    end
    if params.dig(:task, :labeling_id).present?
      @task_labels = Labeling.where(label_id: params[:task][:labeling_id]).pluck(:task_id)
      @tasks=@tasks.where(id: @task_labels)
    end
  end

  def new
    @task=Task.new
  end

  def create
    @task=current_user.tasks.build(task_params)
    if @task.save
      # params[:task][:label_ids].each do |label|
      #   @task.labelings.create(label_id: label)
      # end
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
    params.require(:task).permit(:title, :content, :limit, :status, :priority, label_ids: [])
  end
end
