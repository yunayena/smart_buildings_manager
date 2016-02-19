class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.text :description
      t.string :model
      t.references :location

      t.timestamps null: false
    end
  end
end
