class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc).limit(5)
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  
  def hide
  end

  private

  def task_params
    params.require(:task).permit(:title, :memo, :status)
  end  
end
