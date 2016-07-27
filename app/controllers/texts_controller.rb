class TextsController < ApplicationController

  def send_text
    @task = Task.find(params[:id])
    @text = TextMessage.new(@task.name, @task.date)
    @text.send
    flash.now[:success] = "A text message reminder has been sent"
    render :index
  end


end
