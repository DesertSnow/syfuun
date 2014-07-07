class TodoFinishedController < ApplicationController
  def create
    todo = Todo.find(params[:todo_id])
    todo.finish!

    redirect_to todos_path
  end
end
