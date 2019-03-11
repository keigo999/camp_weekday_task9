class TasksController < ApplicationController
  include TasksHelper

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
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
  
  def hide
  end

  private

  def task_params
    params.require(:task).permit(:title, :memo, :status)
  end  
end
