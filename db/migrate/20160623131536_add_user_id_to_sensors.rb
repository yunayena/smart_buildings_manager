class AddUserIdToSensors < ActiveRecord::Migration
  def change
    add_reference :sensors, :user, index: true
  end
end
