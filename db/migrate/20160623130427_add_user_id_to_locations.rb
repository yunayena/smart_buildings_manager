class AddUserIdToLocations < ActiveRecord::Migration
  def change
    add_reference :location, :user, index: true
  end
end
