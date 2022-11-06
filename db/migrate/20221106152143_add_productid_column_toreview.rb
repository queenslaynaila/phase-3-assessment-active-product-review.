class AddProductidColumnToreview < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :product_id, :integer
  end
end
