class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.integer :zipcode
      t.string :address2
      t.string :country

      t.timestamps
    end
  end
end
