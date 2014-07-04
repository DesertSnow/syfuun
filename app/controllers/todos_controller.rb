class TodosController < ApplicationController
  def index
    @todos = Todo.unfinished.all#finised condition will move to scope
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(params.require(:todo).permit(:title))
    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end
end
