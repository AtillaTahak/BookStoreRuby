class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
		t.references :order, null: false, foreign_key: true
		t.references :book, null: false, foreign_key: true
		t.integer :quantity, null: false, default: 0
		t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
