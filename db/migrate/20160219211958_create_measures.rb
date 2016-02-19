class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.float :value
      t.string :metric
      t.references :sensor

      t.timestamps null: false
    end
  end
end
