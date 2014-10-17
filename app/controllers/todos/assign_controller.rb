class Todos::AssignController < ApplicationController
  def new
    find_people
    find_todo
  end

  def create
    find_todo
    update_todo
    if @todo_as_assign.save
      redirect_to todos_path
    else
      find_people
      render :new
    end
  end

  private

  def find_people
    @people = Person.all
  end

  def find_todo
    @todo_as_assign ||= Todo::AsAssign.find(params[:todo_id])
  end

  def update_todo
    @todo_as_assign.assign_attributes(person_id: params[:person_id])
  end
end