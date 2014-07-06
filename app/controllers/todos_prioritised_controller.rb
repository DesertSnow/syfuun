class TodosPrioritisedController < ApplicationController
  def create
    @todo = Todo.find(params[:todo_id])
    @todo.prioritise!
    redirect_to todos_path
  end
end
