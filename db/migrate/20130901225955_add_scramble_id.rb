class AddScrambleId < ActiveRecord::Migration
  def change
    add_column :milestones, :scramble_id, :number
  end
end
