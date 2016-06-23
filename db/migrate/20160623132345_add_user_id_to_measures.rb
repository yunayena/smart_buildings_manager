class AddUserIdToMeasures < ActiveRecord::Migration
  def change
    add_reference :measures, :user, index: true
  end
end
