class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
      t.integer :trouble_id
      t.integer :indication_id
      t.float :weight
      t.boolean :is_active

      t.timestamps
    end
  end
end
