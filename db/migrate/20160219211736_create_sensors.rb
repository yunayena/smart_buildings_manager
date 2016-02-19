class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.text :description
      t.integer :kind
      t.references :board

      t.timestamps null: false
    end
  end
end
