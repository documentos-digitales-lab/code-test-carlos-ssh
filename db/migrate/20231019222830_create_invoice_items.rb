class CreateInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_items do |t|
      t.integer :invoice_id
      t.integer :product_id
      t.integer :quantity, default: 1
      t.decimal :amount, precision: 10, scale: 2, default: 0.00

      t.timestamps
    end
  end
end


