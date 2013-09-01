class RemoveItemCountColumn < ActiveRecord::Migration
  def change
    remove_column :scrambles, :item_count, :number
  end
end
