class TodosPrioritisedController < ApplicationController
  def create
    @todo = Todo.find(params[:todo_id])
    @todo.update_attribute(:prior, true)
    redirect_to todos_path
  end
end
