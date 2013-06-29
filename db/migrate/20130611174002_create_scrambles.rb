class CreateScrambles < ActiveRecord::Migration
  def change
    create_table :scrambles do |t|
      t.string :title
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
