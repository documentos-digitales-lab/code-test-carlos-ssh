class AddDecimalsToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :sub_total, :decimal, precision: 10, scale: 2
    add_column :invoices, :tax, :decimal, precision: 12, scale: 3
    add_column :invoices, :total, :decimal, precision: 8, scale: 2
  end
end
