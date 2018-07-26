class CreateOrdersProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_products do |t|
      t.references :product, foreign_key: true,index:true
      t.references :order, foreign_key: true,index:true

      t.timestamps
    end
  end
end
