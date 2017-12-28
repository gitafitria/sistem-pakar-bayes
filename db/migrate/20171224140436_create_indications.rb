class CreateIndications < ActiveRecord::Migration[5.0]
  def change
    create_table :indications do |t|
      t.string :indication_name
      t.boolean :is_active

      t.timestamps
    end
  end
end
