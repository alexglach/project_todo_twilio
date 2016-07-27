class TasksController < ApplicationController

  def index
    @tasks = Task.all.sort_by &:date
  end

end
