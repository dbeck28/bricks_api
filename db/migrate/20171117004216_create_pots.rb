class CreatePots < ActiveRecord::Migration[5.1]
  def change
    create_table :pots do |t|
      t.float :value, default: 0.0
      t.timestamps
    end
  end
end
