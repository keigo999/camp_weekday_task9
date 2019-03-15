class TasksController < ApplicationController
  before_action :set_up, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.where(is_display: true).order(created_at: :desc).limit(5)
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "タスクを登録しました。"
      redirect_to @task
    else
      render "new"
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "タスクを更新しました。"
      redirect_to @task
    else
      render "edit"
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end
  
  def hide
    @tasks = Task.where(is_display: false)
  end

  private

  def set_up
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :memo, :status)
  end  
end
