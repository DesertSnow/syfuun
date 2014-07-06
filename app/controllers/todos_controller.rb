class TodosController < ApplicationController
  def index
    @todos = Todo.unfinished#finised condition will move to scope
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(create_params)
    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end

  private
    def create_params
      params.require(:todo).permit(:title)
    end
end
