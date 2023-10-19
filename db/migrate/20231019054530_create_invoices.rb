class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
