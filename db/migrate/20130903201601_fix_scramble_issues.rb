class FixScrambleIssues < ActiveRecord::Migration
  def change
  	remove_column :scrambles, :availableItems, :integer
    remove_column :scrambles, :minimumPrice, :decimal
    add_column :scrambles, :available_items, :integer
    add_column :scrambles, :minimum_price, :decimal
  end
end
