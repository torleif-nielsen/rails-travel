class AddAgentsToSales < ActiveRecord::Migration[5.0]
  def change
    add_reference :sales, :agent, foreign_key: true
  end
end
