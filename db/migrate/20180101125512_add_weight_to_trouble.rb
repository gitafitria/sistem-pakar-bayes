class AddWeightToTrouble < ActiveRecord::Migration[5.0]
  def change
    add_column :troubles, :weight, :float
  end
end
