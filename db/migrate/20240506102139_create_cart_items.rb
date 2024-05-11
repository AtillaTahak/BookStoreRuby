class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
		t.references :user, null: false, foreign_key: true
		t.references :book, null: false, foreign_key: true
		t.integer :quantity, null: false, default: 0

      t.timestamps
    end
  end
end
