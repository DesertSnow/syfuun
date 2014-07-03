class AddFinishedToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :finished, :boolean, null: false, default: false
  end
end
