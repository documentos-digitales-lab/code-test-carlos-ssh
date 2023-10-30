class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :customer, null: false, foreign_key: true
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :tax, precision: 12, scale: 3
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
