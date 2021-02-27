class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :code, null: false

      t.timestamps
    end

    add_index :orders, [:code], unique: true
  end
end
