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

    if @task.save
      flash[:success] = "Your task has been saved!"
      redirect_to task_path(@task.id)
    else
      flash.now[:error] = "Your description must be at least 4 characters"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    flash[:success] = "#{@task.name} has been deleted"
    @task.destroy

    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])

  end

  def update
    @task = Task.find(params[:id])
    if @task.update(whitelisted_params)
      flash[:success] = "#{@task.name} has been updated"
      redirect_to task_path(@task.id)
    else
      flash.now[:error] = "Your description must be at least 4 characters"
      render :edit
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.complete = true
    if @task.save
      flash[:success] = "#{@task.name} has been marked as complete"
      redirect_to tasks_path
    else
      flash.now[:error] = "That task can't be marked for completion"
      render :index
    end
  end


  private

  def whitelisted_params
    params.require(:task).permit(:name, :description, :date)
  end

end
