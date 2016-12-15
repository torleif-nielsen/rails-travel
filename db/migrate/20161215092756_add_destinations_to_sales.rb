class AddDestinationsToSales < ActiveRecord::Migration[5.0]
  def change
    add_reference :sales, :destination, foreign_key: true
  end
end
