class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :discount
      t.integer :limit

      t.timestamps
    end
  end
end
