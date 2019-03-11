class TasksController < ApplicationController
  include TasksHelper

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
    status_confirmation(@task)
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to @task
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
