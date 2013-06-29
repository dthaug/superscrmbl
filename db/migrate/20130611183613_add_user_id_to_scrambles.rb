class AddUserIdToScrambles < ActiveRecord::Migration
  def change
    add_column :scrambles, :user_id, :integer
    add_index :scrambles, :user_id
  end
end
