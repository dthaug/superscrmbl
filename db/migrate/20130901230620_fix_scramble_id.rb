class FixScrambleId < ActiveRecord::Migration
  def change
    add_column :milestones, :scramble_id, :integer
  end
end
