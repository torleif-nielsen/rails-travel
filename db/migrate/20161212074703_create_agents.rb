class CreateAgents < ActiveRecord::Migration[5.0]
  def change
    create_table :agents do |t|
      t.string :name
      t.references :office, foreign_key: true

      t.timestamps
    end
  end
end
