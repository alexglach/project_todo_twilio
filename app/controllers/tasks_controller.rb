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

end
