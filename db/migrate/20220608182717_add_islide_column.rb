class AddIslideColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :isliked, :boolean
  end
end
