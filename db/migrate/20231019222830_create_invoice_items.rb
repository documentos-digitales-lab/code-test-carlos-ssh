class CreateInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_items do |t|
      t.integer :invoice_id
      t.integer :quantity
      t.string :name
      t.decimal :unit_price
      t.decimal :amount

      t.timestamps
    end
  end
end
