class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments, id: :uuid do |t|
      t.uuid :order_id, index: true

      t.string :payer_name
      t.decimal :amount

      t.timestamps
    end
  end
end
