class CreateTroubles < ActiveRecord::Migration[5.0]
  def change
    create_table :troubles do |t|
      t.string :trouble_name
      t.boolean :is_active

      t.timestamps
    end
  end
end
