class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.float :score, default: 0
      t.integer :user_id
      t.timestamps
    end
  end
end
