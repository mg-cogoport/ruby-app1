class AddTaskColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :isdeleted, :boolean
  end
end
