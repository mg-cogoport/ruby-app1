class CreateTask < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
        t.string :title
        t.boolean :status
        t.string :archive
      # t.timestamps
    end
  end
end
