class ChangePriceForScrambles < ActiveRecord::Migration
  change_table :scrambles do |t|
  	t.change :price, :decimal
  end
end
