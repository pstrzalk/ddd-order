class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.uuid :customer_id

      t.jsonb :shipping_address_json
      t.jsonb :billing_address_json

      t.timestamps
    end
  end
end
