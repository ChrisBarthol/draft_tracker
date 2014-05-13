class AddIndexToOwnershipsPlayerId < ActiveRecord::Migration
  def change
  	add_index :ownerships, :player_id, unique: true
  end
end
