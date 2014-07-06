class AddPriorToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :prior, :boolean, null: false, default: false
  end
end
