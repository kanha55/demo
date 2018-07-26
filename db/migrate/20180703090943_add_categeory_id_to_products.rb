class AddCategeoryIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :categeory_id, :integer
  end
end
