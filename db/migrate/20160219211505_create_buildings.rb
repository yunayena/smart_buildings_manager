class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :postal_code
      t.string :phone

      t.timestamps null: false
    end
  end
end
