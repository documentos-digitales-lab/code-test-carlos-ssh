class CreateInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_items do |t|
      t.integer :invoice_id
      t.integer :quantity, default: 0
      t.string :name
      t.decimal :unit_price, default: 0.00
      t.decimal :amount, default: 0.00

      t.timestamps
    end
  end
end
