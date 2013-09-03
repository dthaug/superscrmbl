class ChangeDataTypeSid < ActiveRecord::Migration
  def change
    remove_column :milestones, :scramble_id, :number
    remove_column :milestones, :scramble_id, :integer
  end
end
