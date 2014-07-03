class TodoFinishedController < ApplicationController
  def create
    todo = Todo.find(params[:id])
    todo.update_attribute(:finished, true)#only temporary solution

    redirect_to todos_path
  end
end
