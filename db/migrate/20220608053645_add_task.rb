class AddTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :created_at, :timestamps
    add_column :tasks, :updated_at, :timestamps
  end
end
