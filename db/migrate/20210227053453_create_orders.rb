class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :code, null: false
      t.string :product, null: false
      t.decimal :price, null: false, default: 0.0

      t.timestamps
    end

    add_index :orders, [:code], unique: true
  end
end
