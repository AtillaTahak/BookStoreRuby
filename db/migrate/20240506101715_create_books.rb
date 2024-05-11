class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
		t.string :title, null: false
		t.string :author, null: false
		t.decimal :price, precision: 10, scale: 2
		t.string :description
		t.string :image_url
      t.timestamps
    end
  end
end
