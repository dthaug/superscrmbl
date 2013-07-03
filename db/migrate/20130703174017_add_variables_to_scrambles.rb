class AddVariablesToScrambles < ActiveRecord::Migration
  def change
    add_column :scrambles, :currentDiscountStatus, :string
    add_column :scrambles, :totalBids, :integer
    add_column :scrambles, :nextMilestone, :string
    add_column :scrambles, :bidsUntilNextMilestone, :integer
    add_column :scrambles, :availableItems, :integer
    add_column :scrambles, :currentPrice, :decimal
  end
end
