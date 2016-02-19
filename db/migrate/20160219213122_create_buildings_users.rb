class CreateBuildingsUsers < ActiveRecord::Migration
  def change
    create_table :buildings_users do |t|
      t.references :building
      t.references :user
    end
  end
end
