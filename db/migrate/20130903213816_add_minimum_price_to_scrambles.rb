class AddMinimumPriceToScrambles < ActiveRecord::Migration
  def change
    add_column :scrambles, :minimumPrice, :decimal
  end
end
