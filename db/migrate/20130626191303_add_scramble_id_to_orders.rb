class AddScrambleIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :scramble_id, :integer
  end
end
