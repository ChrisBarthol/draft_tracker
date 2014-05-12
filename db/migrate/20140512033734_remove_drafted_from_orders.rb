class RemoveDraftedFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :drafted
  end
end
