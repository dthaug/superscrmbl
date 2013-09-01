class AddItemCountToScramble < ActiveRecord::Migration
  def change
    add_column :scrambles, :item_count, :number
  end
end
