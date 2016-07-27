class TasksController < ApplicationController

  def index
    @tasks = Task.all.sort_by &:date
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new

  end

  def create
    @task = Task.new(whitelisted_params)
    @task.save
    flash[:success] = "Your task has been saved!"
    redirect_to task_path(@task.id)
  end

  def destroy
    @task = Task.find(params[:id])
    flash[:success] = "#{@task.name} "
    @task.destroy

    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])

  end

  def update
    @task = Task.find(params[:id])
    @task.update(whitelisted_params)
    redirect_to task_path(@task.id)
  end


  private

  def whitelisted_params
    params.require(:task).permit(:name, :description, :date)
  end

end
