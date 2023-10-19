class CreateInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_items do |t|
      t.integer :invoice_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :total_price
      
      t.timestamps
    end
  end
end
