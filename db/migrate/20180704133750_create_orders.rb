class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :fname
      t.string :lname
      t.decimal :total
      
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
