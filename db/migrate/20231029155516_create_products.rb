class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :unit_price, precision: 10, scale: 4, default: 0.00

      t.timestamps
    end
  end
end
