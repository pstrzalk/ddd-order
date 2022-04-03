class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.uuid :customer_id, index: true

      t.string :street
      t.string :postcode
      t.string :city

      t.timestamps
    end
  end
end
