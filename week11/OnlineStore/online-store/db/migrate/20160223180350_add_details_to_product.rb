class AddDetailsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :category, :reference, index: true
    add_column :products, :brand, :reference, index: true
  end
end
