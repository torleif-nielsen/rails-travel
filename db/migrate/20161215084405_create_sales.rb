class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
