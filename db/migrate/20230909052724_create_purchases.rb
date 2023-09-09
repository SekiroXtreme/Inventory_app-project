class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :code
      t.integer :subtotal_amount, default: 0
      t.integer :total_amount, default: 0
      t.date :completed_at
      t.integer :tax_amount, default: 0
      t.string :status, default: ''

      t.timestamps
    end
  end
end
